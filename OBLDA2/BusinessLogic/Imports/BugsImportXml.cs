﻿using BusinessLogicInterface.Imports;
using System.Collections.Generic;
using BusinessLogicInterface;
using Exceptions;
using System.Xml;
using System.IO;
using Domain;
using System;

namespace BusinessLogic.Imports
{
    public class BugsImportXml : BugsImport
    {
        private const string invalidRoute = "Error, it´s not a valid route";

        public BugsImportXml(IBugLogic bugLogic) : base(bugLogic) { }

        public BugsImportXml() : base() { }

        public List<Bug> ImportBugs(string fileAddress)
        {
            if (!File.Exists(fileAddress))
                throw new InvalidDataObjException(invalidRoute);

            List<Bug> bugs = GetBugsString(fileAddress);

            return bugs;
        }

        private List<Bug> GetBugsString(string fileAddress)
        {
            List<Bug> bugs = new List<Bug>();
            Project project=null;

            int id=0;
            string name="";
            string domain="";
            string version="";
            string stateString="";

            XmlReader reader = XmlReader.Create(fileAddress);

            while (reader.Read())
            {
                if (reader.IsStartElement())
                {
                    switch (reader.Name.ToString())
                    {
                        case "Proyecto":
                            project = new Project(reader.ReadString());
                            break;
                        case "Id":
                            id = Convert.ToInt32(reader.ReadString());
                            break;
                        case "Nombre":
                            name = reader.ReadString();
                            break;
                        case "Descripcion":
                            domain = reader.ReadString();
                            break;
                        case "Version":
                            version = reader.ReadString();
                            break;
                        case "Estado":
                            stateString = reader.ReadString();
                            State state = new State(stateString);
                            bugs.Add(new Bug(project, id, name, domain, version, state));
                            break;
                    }
                }
            }

            return bugs;
        }

    }
}
