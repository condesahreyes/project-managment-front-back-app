using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using DataAccess.Repositories;
using DataAccessInterface;
using DataAccess;
using Domain;
using System;
using System.Diagnostics.CodeAnalysis;

namespace Factory
{
    [ExcludeFromCodeCoverage]
    public class RepositoryFactory
    {
        private readonly IServiceCollection _serviceCollection;

        public RepositoryFactory(IServiceCollection services)
        {
            this._serviceCollection = services;
        }

        public void AddCustomServices()
        {
            _serviceCollection.AddScoped<IUserRepository, UserRepository>();
            _serviceCollection.AddScoped<IRepository<Rol, Guid>, Repository<Rol, Guid>>();
            _serviceCollection.AddScoped<IProjectRepository, ProjectRepository>();
            _serviceCollection.AddScoped<IBugRepository, BugRepository>();
            _serviceCollection.AddScoped<IRepository<State, Guid>, Repository<State,Guid>>();
            _serviceCollection.AddScoped<ITaskRepository, TaskRepository>();

            _serviceCollection.AddDbContext<DbContext, DataContext>();
        }

    }
}