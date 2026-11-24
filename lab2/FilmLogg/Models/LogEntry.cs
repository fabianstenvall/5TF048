namespace FilmLogg.Models;

public class LogEntry
{
    public int MovieId { get; set; }
    public string MovieTitle { get; set; } = string.Empty;
    public int Rating { get; set; }
    public string? Comment { get; set; }
    public bool SeenBefore { get; set; }
    public DateTime LoggedAt { get; set; }
}