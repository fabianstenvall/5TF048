namespace FilmLogg.Models;

public class Movie
{
    public int Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public int ReleaseYear { get; set; }
    public int RuntimeMinutes { get; set; }
    public int? StudioId { get; set; }   // null = film utan studio
}