using FilmLogg.Helpers;
using FilmLogg.Models;
using FilmLogg.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace FilmLogg.Controllers;

public class LogController : Controller
{
    private const string SessionKey = "LogEntries";

    public IActionResult Index()
    {
        var entries = HttpContext.Session.GetObject<List<LogEntry>>(SessionKey) ?? new List<LogEntry>();
        ViewBag.Average = entries.Any() ? entries.Average(e => e.Rating) : 0;
        return View(entries);
    }

    [HttpGet]
    public IActionResult Create()
    {
        var model = new LogEntryViewModel { Movies = GetMovieList() };
        return View(model);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public IActionResult Create(LogEntryViewModel model)
    {
        if (!ModelState.IsValid)
        {
            // Listan binds inte från formuläret, så den måste fyllas på igen
            model.Movies = GetMovieList();
            return View(model);
        }

        var movie = MovieRepository.GetMovieById(model.MovieId);
        var entries = HttpContext.Session.GetObject<List<LogEntry>>(SessionKey) ?? new List<LogEntry>();

        entries.Add(new LogEntry
        {
            MovieId = model.MovieId,
            MovieTitle = movie?.Title ?? "Okänd",
            Rating = model.Rating!.Value,
            Comment = model.Comment,
            SeenBefore = model.SeenBefore,
            LoggedAt = DateTime.Now
        });

        HttpContext.Session.SetObject(SessionKey, entries);

        return RedirectToAction(nameof(Index));
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public IActionResult Clear()
    {
        HttpContext.Session.Remove(SessionKey);
        return RedirectToAction(nameof(Index));
    }

    private static List<SelectListItem> GetMovieList()
    {
        return MovieRepository.GetAllMovies()
            .OrderBy(m => m.Title)
            .Select(m => new SelectListItem { Value = m.Id.ToString(), Text = m.Title })
            .ToList();
    }
}