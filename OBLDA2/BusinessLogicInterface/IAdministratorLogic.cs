﻿using System;
using System.Collections.Generic;
using Domain;

namespace BusinessLogicInterface
{
    public interface IAdministratorLogic
    {

        User Create(User adminToCreate);
        IEnumerable<User> GetAll();
        User Get(Guid id);
        Project CreteProject(Project projectToCreate);
        Project UpdateProject(Guid id, Project updatedProject);
        void DeleteProject(Guid id);
        void DeleteTesterByProject(Project project, Guid idTester);
        void DeleteDeveloperByProject(Project project, Guid idDeveloper);
        Bug CreateBug(Bug bugToCreate);
        Bug UpdateBug(int id, Bug updatedBug);
        void DeleteBug(int id);
        void AssignDeveloperByProject(Project project, Guid idDeveloper);
        void AssignTesterByProject(Project project, Guid idTester);
        void ImportBugsByProjectByProvider(Project project, List<Bug> bugsProject);
        int GetFixedBugsByDeveloper(Guid id);
        List<User> GetAllTesters(Project project);
        List<User> GetAllDevelopers(Project project);
        int GetTotalBugByAllProject();


    }
}
