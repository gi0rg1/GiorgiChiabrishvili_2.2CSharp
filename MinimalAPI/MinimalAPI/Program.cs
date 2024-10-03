using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http.HttpResults;
using System.Net.Mime;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

var todoes = new List<Todo>()
{
    new Todo(1, "first task", false)
};

app.MapGet("/todoes", () =>
{
    return TypedResults.Ok(todoes);
});

app.MapGet("/todoes/{id}", Ok<Todo>(int id) =>
{
    var todo = todoes.SingleOrDefault(t => t.id == id);
    return TypedResults.Ok(todo);
});

app.Run();

public record Todo(int id, string name, bool isCompleted);
