using FilmLogg.Models;
using FilmLogg.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace FilmLogg.Controllers;

public class MoviesController : Controller
{
    public IActionResult Index(string? search)
    {
        // Läs förra sökningen från cookien innan vi skriver över den
        ViewBag.LastSearch = Request.Cookies["LastSearch"];

        var movies = MovieRepository.GetAllMovies();

        if (!string.IsNullOrWhiteSpace(search))
        {
            movies = movies
                .Where(m => m.Title.Contains(search, StringComparison.OrdinalIgnoreCase))
                .ToList();

            // Spara sökningen i en cookie i 7 dagar
            Response.Cookies.Append("LastSearch", search, new CookieOptions
            {
                Expires = DateTimeOffset.Now.AddDays(7)
            });
        }

        ViewBag.Search = search;
        ViewBag.TotalRuntime = movies.Sum(m => m.RuntimeMinutes);

        return View(movies);
    }

    public IActionResult Details(int id)
    {
        var movie = MovieRepository.GetMovieById(id);
        if (movie == null)
        {
            return NotFound();
        }

        var studio = movie.StudioId.HasValue
            ? MovieRepository.GetStudioById(movie.StudioId.Value)
            : null;

        var cast = MovieRepository.GetCast(id)
            .Select(c => new CastMemberViewModel
            {
                ActorName = MovieRepository.GetActorById(c.ActorId)?.FullName ?? "Okänd",
                RoleName = c.RoleName
            })
            .ToList();

        var viewModel = new MovieDetailsViewModel
        {
            Movie = movie,
            Studio = studio,
            Cast = cast,
            RuntimeFormatted = $"{movie.RuntimeMinutes / 60} h {movie.RuntimeMinutes % 60} min"
        };

        return View(viewModel);
    }
}