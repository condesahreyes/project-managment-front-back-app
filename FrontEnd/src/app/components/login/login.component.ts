import { SessionService } from 'src/app/services/session/session.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import { Login } from '../../models/session/Login';
import { Router } from '@angular/router';
import { UsersControllerService } from 'src/app/controllers/users-controller.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  form: FormGroup;
  loading = false;
  errorMesage: string = "";
  buttonDisabled!: boolean;

  constructor(
    private fb: FormBuilder,
    private snackBar: MatSnackBar,
    private sessionService: SessionService,
    private userController: UsersControllerService,
    private router: Router
  ) {

    this.form = this.fb.group({
      email: ["", Validators.required],
      password: ["", Validators.required]
    })

  }

  login: Login = {
    Email: "",
    Password: ""
  }

  ngOnInit(): void { 
    this.buttonDisabled = false;
  }

  onLogin() {
    this.buttonDisabled=true;
    this.login.Email = this.form.value.email;
    this.login.Password = this.form.value.password;

    return this.sessionService.postLogin(this.login).subscribe(data => {
      this.sessionService.saveToken(data.token);
      this.loadUser();
    }, error => {
      this.buttonDisabled=false;
      this.errorMesage = error.error;
      this.error(this.errorMesage);
      this.form.reset();
    });
  }

  onLogout() {
    return this.sessionService.postLogout().subscribe(() => {
      this.router.navigateByUrl('login');
      this.sessionService.removeToken();
    });
  }

  error(message: string) {
    this.snackBar.open(message, 'error', {
      duration: 5000,
      horizontalPosition: 'center',
      verticalPosition: 'bottom'
    });
  }

  loadUser() {
    this.userController.saveUserLogued();
    this.loading = true;
    setTimeout(() => {
      this.router.navigateByUrl('dashboard');
    }, 1500);
  }
}
