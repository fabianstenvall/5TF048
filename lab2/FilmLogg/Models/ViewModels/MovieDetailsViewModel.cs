using FilmLogg.Models;

namespace FilmLogg.ViewModels;

public class CastMemberViewModel
{
    public string ActorName { get; set; } = string.Empty;
    public string RoleName { get; set; } = string.Empty;
}

public class MovieDetailsViewModel
{
    public Movie Movie { get; set; } = new Movie();
    public Studio? Studio { get; set; }
    public List<CastMemberViewModel> Cast { get; set; } = new();
    public string RuntimeFormatted { get; set; } = string.Empty;
}