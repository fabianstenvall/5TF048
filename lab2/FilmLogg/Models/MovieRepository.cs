namespace FilmLogg.Models;

public static class MovieRepository
{
    private static readonly List<Studio> _studios = new()
    {
        new Studio { Id = 1, Name = "Paramount Pictures", CountryCode = "US" },
        new Studio { Id = 2, Name = "Miramax", CountryCode = "US" },
        new Studio { Id = 3, Name = "Warner Bros.", CountryCode = "US" },
        new Studio { Id = 4, Name = "Studio Ghibli", CountryCode = "JP" }
    };

    private static readonly List<Actor> _actors = new()
    {
        new Actor { Id = 1, FirstName = "Marlon", LastName = "Brando", BirthYear = 1924 },
        new Actor { Id = 2, FirstName = "Al", LastName = "Pacino", BirthYear = 1940 },
        new Actor { Id = 3, FirstName = "Robert", LastName = "De Niro", BirthYear = 1943 },
        new Actor { Id = 4, FirstName = "John", LastName = "Travolta", BirthYear = 1954 },
        new Actor { Id = 5, FirstName = "Samuel L.", LastName = "Jackson", BirthYear = 1948 },
        new Actor { Id = 6, FirstName = "Brad", LastName = "Pitt", BirthYear = 1963 },
        new Actor { Id = 7, FirstName = "Edward", LastName = "Norton", BirthYear = 1969 },
        new Actor { Id = 8, FirstName = "Christian", LastName = "Bale", BirthYear = 1974 },
        new Actor { Id = 9, FirstName = "Heath", LastName = "Ledger", BirthYear = 1979 },
        new Actor { Id = 10, FirstName = "Michael", LastName = "Caine", BirthYear = 1933 },
        new Actor { Id = 11, FirstName = "Leonardo", LastName = "DiCaprio", BirthYear = 1974 },
        new Actor { Id = 12, FirstName = "Song", LastName = "Kang-ho", BirthYear = 1967 },
        new Actor { Id = 13, FirstName = "Rumi", LastName = "Hiiragi", BirthYear = 1987 }
    };

    private static readonly List<Movie> _movies = new()
    {
        new Movie { Id = 1, Title = "The Godfather", ReleaseYear = 1972, RuntimeMinutes = 175, StudioId = 1 },
        new Movie { Id = 2, Title = "The Godfather Part II", ReleaseYear = 1974, RuntimeMinutes = 202, StudioId = 1 },
        new Movie { Id = 3, Title = "Pulp Fiction", ReleaseYear = 1994, RuntimeMinutes = 154, StudioId = 2 },
        new Movie { Id = 4, Title = "Fight Club", ReleaseYear = 1999, RuntimeMinutes = 139, StudioId = null },
        new Movie { Id = 5, Title = "The Dark Knight", ReleaseYear = 2008, RuntimeMinutes = 152, StudioId = 3 },
        new Movie { Id = 6, Title = "Inception", ReleaseYear = 2010, RuntimeMinutes = 148, StudioId = 3 },
        new Movie { Id = 7, Title = "Spirited Away", ReleaseYear = 2001, RuntimeMinutes = 125, StudioId = 4 },
        new Movie { Id = 8, Title = "Parasite", ReleaseYear = 2019, RuntimeMinutes = 133, StudioId = null },
        new Movie { Id = 9, Title = "Goodfellas", ReleaseYear = 1990, RuntimeMinutes = 145, StudioId = 3 },
        new Movie { Id = 10, Title = "Interstellar", ReleaseYear = 2014, RuntimeMinutes = 169, StudioId = 1 }
    };

    private static readonly List<MovieActor> _cast = new()
    {
        new MovieActor { MovieId = 1, ActorId = 1, RoleName = "Vito Corleone" },
        new MovieActor { MovieId = 1, ActorId = 2, RoleName = "Michael Corleone" },
        new MovieActor { MovieId = 2, ActorId = 2, RoleName = "Michael Corleone" },
        new MovieActor { MovieId = 2, ActorId = 3, RoleName = "Vito Corleone" },
        new MovieActor { MovieId = 3, ActorId = 4, RoleName = "Vincent Vega" },
        new MovieActor { MovieId = 3, ActorId = 5, RoleName = "Jules Winnfield" },
        new MovieActor { MovieId = 4, ActorId = 6, RoleName = "Tyler Durden" },
        new MovieActor { MovieId = 4, ActorId = 7, RoleName = "Berättaren" },
        new MovieActor { MovieId = 5, ActorId = 8, RoleName = "Bruce Wayne" },
        new MovieActor { MovieId = 5, ActorId = 9, RoleName = "Jokern" },
        new MovieActor { MovieId = 5, ActorId = 10, RoleName = "Alfred Pennyworth" },
        new MovieActor { MovieId = 6, ActorId = 11, RoleName = "Dom Cobb" },
        new MovieActor { MovieId = 6, ActorId = 10, RoleName = "Miles" },
        new MovieActor { MovieId = 7, ActorId = 13, RoleName = "Chihiro (röst)" },
        new MovieActor { MovieId = 8, ActorId = 12, RoleName = "Kim Ki-taek" },
        new MovieActor { MovieId = 9, ActorId = 3, RoleName = "James Conway" },
        new MovieActor { MovieId = 10, ActorId = 10, RoleName = "Professor Brand" }
    };

    public static List<Movie> GetAllMovies() => _movies;

    public static Movie? GetMovieById(int id) => _movies.FirstOrDefault(m => m.Id == id);

    public static Studio? GetStudioById(int id) => _studios.FirstOrDefault(s => s.Id == id);

    public static List<Studio> GetAllStudios() => _studios;

    public static List<Actor> GetAllActors() => _actors;

    public static Actor? GetActorById(int id) => _actors.FirstOrDefault(a => a.Id == id);

    public static List<MovieActor> GetCast(int movieId) =>
        _cast.Where(c => c.MovieId == movieId).ToList();
}