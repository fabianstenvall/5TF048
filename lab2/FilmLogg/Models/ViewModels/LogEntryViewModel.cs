using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace FilmLogg.ViewModels;

public class LogEntryViewModel
{
    [Range(1, int.MaxValue, ErrorMessage = "Välj en film.")]
    [Display(Name = "Film")]
    public int MovieId { get; set; }

    [Required(ErrorMessage = "Välj ett betyg.")]
    [Range(1, 5, ErrorMessage = "Betyget måste vara mellan 1 och 5.")]
    [Display(Name = "Betyg")]
    public int? Rating { get; set; }

    [StringLength(200, ErrorMessage = "Kommentaren får vara högst 200 tecken.")]
    [Display(Name = "Kommentar")]
    public string? Comment { get; set; }

    [Display(Name = "Har sett den förut")]
    public bool SeenBefore { get; set; }

    public List<SelectListItem> Movies { get; set; } = new();
}