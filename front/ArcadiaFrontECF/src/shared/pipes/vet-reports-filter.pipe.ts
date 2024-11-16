import { Pipe, PipeTransform } from '@angular/core';
import {IFeeding} from "../interfaces/feeding.interface";
import {IVetReport} from "../interfaces/vet-reports.interface";

@Pipe({
  name: 'vetReportsFilter',
  standalone: true
})
export class VetReportsFilterPipe implements PipeTransform {

  transform(reports: IVetReport[], species: number, name: string, startDate?: Date, endDate?: Date): IVetReport[] | null | undefined {
    if(!reports) return null;
    // if(!species && !name && !startDate && !endDate) return reports;
    // if(species == 0 && name.toLowerCase() == 'tous') return reports;

    let filteredReports = reports;


    // Choose Species
    if (species && species !== 0) {
      filteredReports = filteredReports.filter(r => r.animal.speciesData.id === species);
    }

    // Choose Name
    if (name && name.toLowerCase() !== 'tous') {
      filteredReports = filteredReports.filter(r => r.animal.name.toLowerCase() === name.toLowerCase());
    }

    // Choose Dates
    if (startDate) {
      filteredReports = filteredReports.filter(r => new Date(r.visitDate) >= new Date(startDate));
    }

    if (endDate) {
      filteredReports = filteredReports.filter(r => new Date(r.visitDate) <= new Date(endDate));
    }

    return filteredReports;
  }

}
