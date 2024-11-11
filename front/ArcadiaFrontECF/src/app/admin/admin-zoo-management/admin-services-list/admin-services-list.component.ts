import {Component} from '@angular/core';
import {IZooService} from "../../../../shared/interfaces/zoo-service.interface";
import {Observable} from "rxjs";
import {ZooServiceService} from "../../../../shared/services/zoo-service.service";
import {AnimalFilterPipe} from "../../../../shared/pipes/animal-filter.pipe";
import {AsyncPipe, TitleCasePipe} from "@angular/common";
import {LoadingSpinnerComponent} from "../../../loading-spinner/loading-spinner.component";
import {RouterLink} from "@angular/router";
import {IUser} from "../../../../shared/interfaces/user.interface";
import {AuthService} from "../../../../shared/services/auth.service";

@Component({
  selector: 'app-admin-services-list',
  standalone: true,
  imports: [
    AnimalFilterPipe,
    AsyncPipe,
    LoadingSpinnerComponent,
    TitleCasePipe,
    RouterLink
  ],
  templateUrl: './admin-services-list.component.html',
  styleUrl: './admin-services-list.component.css'
})
export class AdminServicesListComponent {
  public services$: Observable<IZooService[]> = new Observable<IZooService[]>();
  public user$: Observable<IUser | undefined> = new Observable<IUser | undefined>();

  constructor(private zooServices: ZooServiceService, private authService: AuthService) {
    this.services$ = this.zooServices.zooServices$
    this.user$ = this.authService.user$;
  }

  ngOnInit() {
    this.zooServices.fetchAllData();
  }

  public getPath(id: number | undefined): string {
    if (id != undefined) {
      return `detailed/${id}`;
    } else {
      return 'register';
    }
  }

  public deleteService(id: number | undefined): void {
    if (confirm('Voulez vous vraiment supprimer ce service?')) {
      if (id) this.zooServices.deleteService(id);
    }
  }


}
