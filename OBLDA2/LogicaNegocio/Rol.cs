﻿using System;

namespace Domain
{
    public class Rol
    {
        Guid Id { get; set; }
        String Name { get; set; }

        public Rol(Guid id, string name)
        {
            this.Id = id;
            this.Name = name;
        }
    }
}
