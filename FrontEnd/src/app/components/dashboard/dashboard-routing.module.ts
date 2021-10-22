import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BugsComponent } from './bugs/bugs.component';
import { DashboardComponent } from './dashboard.component';
import { ProjectsComponent } from './projects/projects.component';
import { StartComponent } from './start/start.component';
import { UsersComponent } from './users/users.component';

const routes: Routes = [
  {path: '', component: DashboardComponent, children: [
   {path:'', component: StartComponent},
    {path:'users', component: UsersComponent},
    {path:'projects', component: ProjectsComponent},
    {path:'bugs', component: BugsComponent},


  ]},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule { }