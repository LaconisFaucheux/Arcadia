import {Component} from '@angular/core';
import {Observable} from "rxjs";
import {VetReportsService} from "../../../../shared/services/vet-reports.service";
import {AnimalService} from "../../../../shared/services/animal.service";
import {IAnimal} from "../../../../shared/interfaces/animal.interface";
import {IVetReport} from "../../../../shared/interfaces/vet-reports.interface";
import {AsyncPipe, DatePipe} from "@angular/common";
import {RouterLink} from "@angular/router";
import {LoadingSpinnerComponent} from "../../../loading-spinner/loading-spinner.component";
import {IUser} from "../../../../shared/interfaces/user.interface";
import {AuthService} from "../../../../shared/services/auth.service";
import {AnimalsBySpeciesPipe} from "../../../../shared/pipes/animals-by-species.pipe";
import {ReactiveFormsModule} from "@angular/forms";
import {ISpecies} from "../../../../shared/interfaces/species.interface";
import {VetReportsFilterPipe} from "../../../../shared/pipes/vet-reports-filter.pipe";

@Component({
  selector: 'app-admin-vet-visits-list',
  standalone: true,
  imports: [
    AsyncPipe,
    DatePipe,
    RouterLink,
    LoadingSpinnerComponent,
    AnimalsBySpeciesPipe,
    ReactiveFormsModule,
    VetReportsFilterPipe
  ],
  templateUrl: './admin-vet-visits-list.component.html',
  styleUrl: './admin-vet-visits-list.component.css'
})
export class AdminVetVisitsListComponent {

  public reports$: Observable<IVetReport[]> = new Observable<IVetReport[]>();
  public report$: Observable<IVetReport | null> = new Observable<IVetReport | null>();
  public animals$: Observable<IAnimal[]> = new Observable<IAnimal[]>();
  private animals: IAnimal[] = [];
  public user$: Observable<IUser | undefined> = new Observable<IUser | undefined>();
  public species$: Observable<ISpecies[]> = new Observable<ISpecies[]>();
  public selectedSpecies: number = 0;
  public selectedName: string = 'Tous';
  public startDate: Date = new Date("2024-01-01");
  public endDate: Date = new Date();

  constructor(private reportService: VetReportsService, private animalService: AnimalService, private authService: AuthService) {
    this.reports$ = this.reportService.reports$;
    this.report$ = this.reportService.report$;
    this.animals$ = this.animalService.animals$;
    this.species$ = this.animalService.species$;
    this.user$ = this.authService.user$
  }

  ngOnInit() {
    this.reportService.fetchReports()
    this.animalService.fetchAllData()

    this.animals$.subscribe(a => {
      this.animals = a
    })
  }

  public getAnimalSpecies(id: number | undefined): string {
    if (id) {
      let animal = this.animals.find(a => a.id === id)
      return animal?.speciesData.name ?? '';
    } else {
      return ''
    }
  }

  public getDetailedReport(id: number | undefined) {
    if (id) {
      this.reportService.fetchReport(id.toString());
    }
  }

  public nullifyReport() {
    this.reportService.fetchReport('0');
  }

  public deleteReport(id: number | undefined) {
    if (confirm('Voulez vous vraiment supprimer ce rapport?')) {
      if (id) this.reportService.deleteReport(id.toString());
    }
  }

  public setSelectedSpecies(event: any) {
    if(event.target.value){
      this.selectedSpecies = event.target.value
    } else {
      return;
    }
  }

  public setSelectedName(event: any) {
    if(event.target.value){
      this.selectedName = event.target.value
    } else {
      return;
    }
  }

  public setStartDate(event: any) {
    if(event.target.value){
      this.startDate = new Date(event.target.value)
    } else{
      return;
    }
  }

  public setEndDate(event: any) {
    if(event.target.value){
      this.endDate = new Date (event.target.value)
    } else{
      return;
    }
  }

}
