import {Component} from '@angular/core';
import {RouterLink, RouterOutlet} from "@angular/router";
import {Observable} from "rxjs";
import {IUser} from "../../../../shared/interfaces/user.interface";
import {AnimalService} from "../../../../shared/services/animal.service";
import {HabitatService} from "../../../../shared/services/habitat.service";
import {DashboardService} from "../../../../shared/services/dashboard.service";
import {AuthService} from "../../../../shared/services/auth.service";
import {AsyncPipe} from "@angular/common";

@Component({
  selector: 'app-admin-zoo-management-landing-page',
  standalone: true,
  imports: [
    RouterLink,
    RouterOutlet,
    AsyncPipe
  ],
  templateUrl: './admin-zoo-management-landing-page.component.html',
  styleUrl: './admin-zoo-management-landing-page.component.css'
})
export class AdminZooManagementLandingPageComponent {
  public user$: Observable<IUser | undefined> = new Observable<IUser | undefined>();

  constructor( private authService: AuthService) {
    this.user$ = authService.user$;
  }
}
