import { Component } from '@angular/core';
import {LoginRequest} from "../../shared/interfaces/login-request.interface";
import {FormsModule} from "@angular/forms";
import {AuthService} from "../../shared/services/auth.service";
import {CookieService} from "ngx-cookie-service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-auth',
  standalone: true,
  imports: [
    FormsModule
  ],
  templateUrl: './auth.component.html',
  styleUrl: './auth.component.css'
})
export class AuthComponent {
  model: LoginRequest

  constructor(private authService: AuthService, private cookieService: CookieService, private router: Router) {
    this.authService.logout();
    this.model = {
      email:'',
      password: ''
    }
  }

  public OnFormSubmit(): void {
    this.authService.login(this.model)
      .subscribe({
        next: (res) => {
          //Set auth cookie with ngx cookie service
          this.cookieService.set('Authorization', `Bearer ${res.token}`, undefined, '/', undefined, true, 'Strict');//SameSite =  true, CSRF Protection
          //console.log(res.token)
          //Set user
          this.authService.setUser({id: res.userId, email: res.email, roles: res.roles});
          //Redirection:
          this.router.navigateByUrl('/admin');
        },
        error: (error) => {
          alert("Echec de l'authentification")
        }

      })
  }
}


