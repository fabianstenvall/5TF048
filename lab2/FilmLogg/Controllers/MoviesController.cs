using FilmLogg.Models;
using FilmLogg.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace FilmLogg.Controllers;

public class MoviesController : Controller
{
    public IActionResult Index()
    {
        var movies = MovieRepository.GetAllMovies();
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