import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { User } from '../../models/users/User';
import { environment } from 'src/environments/environment';
import { UserEntryModel } from 'src/app/models/users/UserEntryModel';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(
    private http: HttpClient
  ) { }

  private uri: string = `${environment.URI_BASE}/users`;

  getUsers(): Observable<UserEntryModel[]> {
    return this.http.get<UserEntryModel[]>(this.uri);
  }

  getById(userId: string): Observable<User> {
    return this.http.get<User>(this.uri + '/' + userId);
  }

  createUser(user: User) {
    return this.http.post<User>(this.uri, {
      Name: user.name,
      LastName: user.lastName,
      UserName: user.userName,
      Password: user.password,
      Email: user.email,
      Rol: user.rol,
      Price: user.price
    });
  }

}