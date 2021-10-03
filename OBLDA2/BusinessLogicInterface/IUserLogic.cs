﻿using System.Collections.Generic;
using Domain;
using System;

namespace BusinessLogicInterface
{
    public interface IUserLogic
    {
        User Create(User userToCreate);
        User Get(Guid id);
        List<User> GetAll();
        void Update(User user);
    }
}
