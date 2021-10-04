using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using BusinessLogic.UserRol;
using DataAccessInterface;
using System.Linq;
using Domain;
using System;
using Moq;

namespace BusinessLogicTest
{
    [TestClass]
    public class TesterLogicTest
    {

        private Mock<IUserRepository> mockUser;
        private Mock<IProjectRepository> mockProject;
        private Mock<IRepository<Rol, Guid>> mockRol;
        private Mock<IRepository<Bug, int>> mockBug;

        private List<Rol> roles;

        private User tester;

        private TesterLogic testerLogic;

        [TestInitialize]
        public void Setup()
        {
            mockProject = new Mock<IProjectRepository>(MockBehavior.Strict);
            mockUser = new Mock<IUserRepository>(MockBehavior.Strict);
            mockBug = new Mock<IRepository<Bug, int>>(MockBehavior.Strict);

            CofnigurationMockRol();

            tester = new User("Diego", "Asadurian", "diegoAsa", "admin1234",
                "diegoasadurian@gmail.com", roles[0]);

            testerLogic = new TesterLogic(mockUser.Object, mockProject.Object, mockRol.Object, mockBug.Object);
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
        public void CreateTester()
        {
            List<User> users = new List<User>();
            mockUser.Setup(x => x.GetAll()).Returns(users);
            mockUser.Setup(x => x.Create(tester)).Returns(tester);

            var testerLogic = new TesterLogic(mockUser.Object, mockProject.Object, mockRol.Object,
                mockBug.Object);

            User userSaved = testerLogic.Create(tester);

            mockUser.VerifyAll();

            Assert.AreEqual(tester, userSaved);
        }

        [TestMethod]
        public void GetAllBugs()
        {
            Project project = new Project("Montes Del Plata");

            project.Users.Add(tester);

            State stateActive = new State(State.active);
            List<Bug> bugs = new List<Bug>
            {
                new Bug(project, 1234, "Error de login", "Intento inicio de sesion", "2.0", stateActive),
                new Bug(project, 4321, "Error de UI", "Intento inicio de sesion", "2.1", stateActive),
            };

            List<Project> projects = new List<Project>();
            projects.Add(project);

            project.Bugs.AddRange(bugs);

            mockProject.Setup(r => r.GetAllGeneric()).Returns(projects);
            

            List<Bug> bugsSaved = testerLogic.GetAllBugs(tester);

            mockUser.VerifyAll();
            Assert.IsTrue(bugsSaved.SequenceEqual(bugs));
        }

        [TestMethod]
        public void GetAllTesters()
        {
            List<User> list = new List<User>();
            list.Add(tester);
            mockUser.Setup(x => x.GetAll()).Returns(list);

            List<User> ret = testerLogic.GetAll();
            mockUser.VerifyAll();
            Assert.IsTrue(ret.SequenceEqual(list));
        }

        [TestMethod]
        public void GetTesterIdOk()
        {
            Guid id = Guid.NewGuid();
            mockUser.Setup(x => x.Get(It.IsAny<Guid>())).Returns(tester);
            var ret = testerLogic.Get(id);
            mockUser.VerifyAll();
            Assert.IsTrue(ret.Equals(tester));
        }

        [TestMethod]
        public void CreateBugByTester()
        {
            Project project = new Project("Montes Del Plata");
            State stateActive = new State(State.active);

            var bug = new Bug(project, 1, "Error de login", "Intento de sesi�n", "3.0", stateActive);

            mockBug.Setup(x => x.Create(bug)).Returns(bug);

            var ret = testerLogic.CreateBug(bug);
            mockBug.VerifyAll();

            Assert.IsTrue(ret.Id == bug.Id);
        }
    }
}