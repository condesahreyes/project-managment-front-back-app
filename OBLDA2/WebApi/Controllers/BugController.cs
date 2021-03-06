using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using BusinessLogicInterface;
using OBLDA2.Controllers;
using WebApi.Filters;
using OBLDA2.Models;
using System.Net;
using Domain;
using System;

namespace WebApi.Controllers
{

    [Route("penguin/bugs")]
    public class BugController : ApiBaseController
    {
        private readonly IBugLogic bugLogic;

        public BugController(IBugLogic bugLogic)
        {
            this.bugLogic = bugLogic;
        }

        [HttpPost]
        [AuthorizationFilter(Autorization.AdministratorAndTester)]
        public IActionResult AddBug(BugEntryOutModel bugDTO)
        {
            Bug bug = this.bugLogic.CreateByUser(bugDTO.ToEntity(), Guid.Parse(bugDTO.CreatedBy));

            return (StatusCode((int)HttpStatusCode.Created, new BugEntryOutModel(bug)));
        }

        [HttpGet]
        [AuthorizationFilter(Autorization.Administrator)]
        public IActionResult GetAllBugs()
        {
            List<Bug> bugs = this.bugLogic.GetAll();

            return Ok(BugEntryOutModel.ListBugs(bugs));
        }
       

        [HttpGet("{bugId}")]
        [AuthorizationFilter(Autorization.AdministratorAndTester)]
        public IActionResult GetById(int bugId, UserIdModel user)
        {
            Bug bugToReturn = this.bugLogic.Get(bugId, user.UserId);

            return Ok(new BugEntryOutModel(bugToReturn));
        }

        [HttpDelete("{bugId}/byUser/{userId}")]
        [AuthorizationFilter(Autorization.AdministratorAndTester)]
        public IActionResult Delete(int bugId, Guid userId)
        {
            bugLogic.Delete(bugId, userId);

            return NoContent();
        }

        [HttpPut("{bugId}")]
        [AuthorizationFilter(Autorization.AdministratorAndTester)]
        public IActionResult UpdateABug(int bugId, BugUpdateModel bugDTO)
        {
            this.bugLogic.Update(bugId, bugDTO.ToEntity(bugId), Guid.Parse(bugDTO.UserId));

            return NoContent();
        }

    }
}