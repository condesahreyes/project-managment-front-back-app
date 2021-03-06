import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Bug } from 'src/app/models/bug/Bug';
import { ProjectOut } from 'src/app/models/project/ProjectOut';
import { Task } from 'src/app/models/task/task';
import { User } from 'src/app/models/users/User';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class TesterService {

  constructor(
    private http: HttpClient
  ) { }

  private uri: string = `${environment.URI_BASE}/testers`;

  assignTesterToProject(projectId: string, testerId: string) {
    return this.http.post((this.uri + '/' + testerId + '/' + 'project' + '/' + projectId), {
    });
  }

  deassignTesterToProject(projectId: string, testerId: string) {
    return this.http.delete(this.uri + '/' + testerId + '/' + 'project' + '/' + projectId);
  }

  getAll(): Observable<User[]> {
    return this.http.get<User[]>(this.uri);
  }

  getAllBugsByTester(testerId: string): Observable<Bug[]> {
    return this.http.get<Bug[]>(this.uri + '/' + testerId + '/bugs');
  }

  getAllProjectsByTester(testerId: string): Observable<ProjectOut[]> {
    return this.http.get<ProjectOut[]>(this.uri + '/' + testerId + '/projects');
  }

  getTasks(idTester: string): Observable<Task[]> {
    return this.http.get<Task[]>(this.uri + '/' + idTester + '/tasks');
  }

}
