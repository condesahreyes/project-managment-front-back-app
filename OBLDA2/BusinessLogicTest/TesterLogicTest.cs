using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using BusinessLogic.UserRol;
using BusinessLogicInterface;
using DataAccessInterface;
using System.Linq;
using Domain;
using System;
using Moq;
using System.Diagnostics.CodeAnalysis;

namespace BusinessLogicTest
{
    [TestClass]
    [ExcludeFromCodeCoverage]
    public class TesterLogicTest
    {

        private Mock<IUserLogic> userLogic;
        private Mock<IProjectLogic> mockProject;
        private Mock<IRepository<Rol, Guid>> mockRol;

        private List<Rol> roles;

        private User tester;

        private TesterLogic testerLogic;

        [TestInitialize]
        public void Setup()
        {
            mockProject = new Mock<IProjectLogic>(MockBehavior.Strict);
            userLogic = new Mock<IUserLogic>(MockBehavior.Strict);

            CofnigurationMockRol();

            tester = new User("Diego", "Asadurian", "diegoAsa", "admin1234",
                "diegoasadurian@gmail.com", roles[0], 0);

            testerLogic = new TesterLogic(userLogic.Object, mockProject.Object);
        }

        private void CofnigurationMockRol()
        {
            mockRol = new Mock<IRepository<Rol, Guid>>(MockBehavior.Strict);

            roles = new List<Rol>
            {
                new Rol(Rol.tester),
                new Rol(Rol.administrator),
                new Rol(Rol.administrator),
            };

            mockRol.Setup(x => x.GetAllGeneric()).Returns(roles);
        }

        [TestMethod]
        public void GetAllBugs()
        {
            Project project = new Project("Montes Del Plata");

            project.Users.Add(tester);

            State stateActive = new State(State.active);
            List<Bug> bugs = new List<Bug>
            {
                new Bug(project, 1234, "Error de login", 
                "Intento inicio de sesion", "2.0", stateActive, 0),
                new Bug(project, 4321, "Error de UI", 
                "Intento inicio de sesion", "2.1", stateActive, 0),
            };

            List<Project> projects = new List<Project>();
            projects.Add(project);

            project.Bugs.AddRange(bugs);

            mockProject.Setup(r => r.GetAll()).Returns(projects);
            userLogic.Setup(r => r.Get(tester.Id)).Returns(tester);
            
            List<Bug> bugsSaved = testerLogic.GetAllBugs(tester.Id);

            userLogic.VerifyAll();
            mockProject.VerifyAll();
            Assert.IsTrue(bugsSaved.SequenceEqual(bugs));
        }

        [TestMethod]
        public void GetAllProject()
        {
            List<Project> projects = new List<Project>();
            Project project = new Project(Rol.tester);
            projects.Add(project);
            project.Users.Add(tester);

            mockProject.Setup(x => x.GetAll()).Returns(projects);
            userLogic.Setup(r => r.Get(tester.Id)).Returns(tester);

            List<Project> projectsByTester = testerLogic.GetAllProjects(tester.Id);

            mockProject.VerifyAll();
            userLogic.VerifyAll();
            Assert.IsTrue(projectsByTester.SequenceEqual(projects));
        }

        [TestMethod]
        public void GetAllTesters()
        {
            List<User> list = new List<User>();
            list.Add(tester);
            userLogic.Setup(x => x.GetAll()).Returns(list);

            List<User> ret = testerLogic.GetAll();
            userLogic.VerifyAll();

            Assert.IsTrue(ret.SequenceEqual(list));
        }

        [TestMethod]
        public void GetTesterIdOk()
        {
            Guid id = Guid.NewGuid();
            userLogic.Setup(x => x.Get(It.IsAny<Guid>())).Returns(tester);
            var ret = testerLogic.Get(id);
            userLogic.VerifyAll();
            Assert.IsTrue(ret.Equals(tester));
        }

        [TestMethod]
        public void AssignUserToProject()
        {
            mockProject.Setup(x => x.AssignUser(It.IsAny<Guid>(), ref tester));
            userLogic.Setup(x => x.Get(It.IsAny<Guid>())).Returns(tester);

            testerLogic.AssignTesterToProject(It.IsAny<Guid>(), tester.Id);
            mockProject.VerifyAll();

            Assert.IsTrue(true);
        }

        [TestMethod]
        public void DeleteUserToProject()
        {
            mockProject.Setup(x => x.DeleteUser(It.IsAny<Guid>(), ref tester));
            userLogic.Setup(x => x.Get(It.IsAny<Guid>())).Returns(tester);

            testerLogic.DeleteTesterInProject(It.IsAny<Guid>(), tester.Id);
            mockProject.VerifyAll();

            Assert.IsTrue(true);
        }
    }
}