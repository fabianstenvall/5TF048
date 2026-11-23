namespace FilmLogg.Models;

public class MovieActor
{
    public int MovieId { get; set; }
    public int ActorId { get; set; }
    public string RoleName { get; set; } = string.Empty;
}