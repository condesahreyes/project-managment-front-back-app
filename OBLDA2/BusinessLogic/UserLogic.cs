﻿using System.Collections.Generic;
using System.Linq;
using System;
using System.Linq;
using Domain;
using DataAccessInterface;

namespace BusinessLogic
{
    public class UserLogic
    {

        private IRepository<User,Guid> userDA;
        private IRepository<Rol, Guid> rolRepository;

        public UserLogic(IRepository<User,Guid> UserDA, IRepository<Rol, Guid> rolRepository)
        {
            this.userDA = UserDA;
            this.rolRepository = rolRepository;
        }

        public User Create(User userToCreate)
        {
            IsValidUser(userToCreate);
            NotExistUser(userToCreate);

            User userCreate = userDA.Create(userToCreate);

            return userCreate;
        }

        private void IsValidUser(User userToCreate)
        {
            ValidateRol(userToCreate.Rol);
            User.IsValidUser(userToCreate);
        }

        private void NotExistUser(User user)
        {
            bool existUser = userDA.GetAll().Any(u => (u.Email == user.Email));

            if (existUser)
            {
                throw new Exception("The user already exists");
            }
        }

        private void ValidateRol(Rol rol)
        {
            IEnumerable<Rol> roles = rolRepository.GetAll();

            if (!roles.Contains(rol))
                throw new Exception();
        }

        public User Get(Guid id)
        {

            User user = userDA.Get(id);

            if (user == null)
            {
                throw new Exception("User does not exist");
            }

            return user;
        }

    }
}
