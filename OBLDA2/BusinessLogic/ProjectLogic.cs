﻿using System.Collections.Generic;
using BusinessLogicInterface;
using DataAccessInterface;
using Exceptions;
using System;
using Domain;

namespace BusinessLogic
{
    public class ProjectLogic : IProjectLogic
    {
        private const string notExistProject = "Project does not exist";
        private const string existProject = "Project alraedy exist";
        private const string userExistingProject = "This user alraedy exist in the project";
        private const string notUserInProject = "This user is not asigned to this project";

        private IProjectRepository projectRepository;
        private IUserLogic userLogic;

        public ProjectLogic() { }

        public ProjectLogic(IProjectRepository ProjectDa, IUserLogic userLogic)
        {
            this.projectRepository = ProjectDa;
            this.userLogic = userLogic;
        }

        public Project Create(Project projectToCreate)
        {
            NotExistProjectWithName(projectToCreate);

            Project.ValidateName(projectToCreate.Name);

            projectToCreate.Bugs = new List<Bug>();
            projectToCreate.Users = new List<User>();

            return projectRepository.Create(projectToCreate);
        }

        public Project Get(Guid id)
        {
            Project projcet = projectRepository.GetById(id);

            if (projcet == null)
            {
                throw new NoObjectException(notExistProject);
            }

            return projcet;
        }

        public Project ExistProjectWithName(Project project)
        {
            List<Project> projects = projectRepository.GetAll();

            foreach (Project oneProject in projects)
            {
                if (oneProject.Name.ToLower() == project.Name.ToLower())
                {
                    return oneProject;
                }
            }

            throw new InvalidDataObjException(notExistProject);
        }

        public void NotExistProjectWithName(Project project)
        {
            List<Project> projects = projectRepository.GetAll();

            foreach (Project oneProject in projects)
            {
                if (oneProject.Name.ToLower() == project.Name.ToLower() && 
                    project.Id != oneProject.Id)
                {
                    throw new InvalidDataObjException(existProject);
                }
            }
        }

        public void ExistProject(Guid projectId)
        {
            ExistProjectWithName(Get(projectId));
        }

        public Project Update(Guid id, Project updatedProject)
        {
            ExistProject(id);
            updatedProject.Id = id;
            NotExistProjectWithName(updatedProject);
            Project.ValidateName(updatedProject.Name);
            return projectRepository.Update(id, updatedProject);
        }

        public void Delete(Guid id)
        {
            ExistProject(id);
            projectRepository.Delete(id);
        }

        public void DeleteUser(Guid oneProjectId, ref User user)
        {
            User userToAsign = userLogic.Get(user.Id);

            DeleteUserToProject(ref userToAsign, oneProjectId);
        }

        private void DeleteUserToProject(ref User user, Guid oneProjectId)
        {
            Project project = Get(oneProjectId);

            if (!project.Users.Contains(user))
            {
                throw new InvalidDataObjException(notUserInProject);
            }

            project.Users.Remove(user);
            projectRepository.Update(project.Id, project);
        }

        public void AssignUser(Guid oneProjectId, ref User user)
        {
            AssignUserToProject(ref user, oneProjectId);
        }

        private void AssignUserToProject(ref User userToAsign, Guid oneProjectId)
        {
            Project project = Get(oneProjectId);

            if (project.Users.Contains(userToAsign))
            {
                throw new ExistingObjectException(userExistingProject);
            }

            project.Users.Add(userToAsign);
            projectRepository.Update(project.Id, project);
        }

        public List<Project> GetAll()
        {
            return projectRepository.GetAll();
        }

        public List<User> GetAllTesters(Project oneProject)
        {
            return GetAllUserByRol(Rol.tester, oneProject);
        }

        public List<User> GetAllDevelopers(Project oneProject)
        {
            return GetAllUserByRol(Rol.developer, oneProject);
        }

        private List<User> GetAllUserByRol(string rol, Project oneProject)
        {
            List<User> users = new List<User>();

            Project project = Get(oneProject.Id);

            foreach (User user in project.Users)
            {
                if (user.Rol.Name.ToLower() == rol.ToLower())
                    users.Add(user);
            }

            return users;
        }

        public List<Bug> GetAllBugByProject(Project project)
        {
            return Get(project.Id).Bugs; 
        }

    }
}
