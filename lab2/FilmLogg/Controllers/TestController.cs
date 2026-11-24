using FilmLogg.Models;
using Microsoft.AspNetCore.Mvc;

namespace FilmLogg.Controllers;

public class TestController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    // 1. ViewBag: dynamiska egenskaper som skickas till vyn
    public IActionResult ViewBagDemo()
    {
        var movies = MovieRepository.GetAllMovies();

        ViewBag.Message = "Data skickad med ViewBag";
        ViewBag.MovieCount = movies.Count;
        ViewBag.TotalRuntime = movies.Sum(m => m.RuntimeMinutes);

        return View();
    }

    // 2. ViewData: dictionary med nycklar (strängar)
    public IActionResult ViewDataDemo()
    {
        var movies = MovieRepository.GetAllMovies();

        ViewData["Message"] = "Data skickad med ViewData";
        ViewData["LongestMovie"] = movies.OrderByDescending(m => m.RuntimeMinutes).First().Title;
        ViewData["NewestYear"] = movies.Max(m => m.ReleaseYear);

        return View();
    }

    // 3. Modell som parameter till View()
    public IActionResult ModelDemo()
    {
        var movie = MovieRepository.GetMovieById(5);
        return View(movie);
    }
}