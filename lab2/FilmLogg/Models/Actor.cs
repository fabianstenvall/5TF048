namespace FilmLogg.Models;

public class Actor
{
    public int Id { get; set; }
    public string FirstName { get; set; } = string.Empty;
    public string LastName { get; set; } = string.Empty;
    public int? BirthYear { get; set; }

    public string FullName => $"{FirstName} {LastName}";
}