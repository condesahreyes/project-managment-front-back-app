import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Bug } from 'src/app/models/bug/Bug';
import { BugService } from 'src/app/services/bug/bug.service';
import { BugFormComponent } from './bug-form/bug-form.component';

@Component({
  selector: 'app-bugs',
  templateUrl: './bugs.component.html',
  styleUrls: ['./bugs.component.css']
})
export class BugsComponent implements OnInit {

  displayedColumns = ['name', 'domain', 'version', 'state', 'actions']; //'project', 'solved by',
  bugs: Bug[] = [];
  dataSource!: MatTableDataSource<Bug>;

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  constructor(
    private bugService: BugService,
    public dialog: MatDialog
  ) { }

  setPaginatorAndSort() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  ngOnInit(): void {
    this.getProjectsCreated();

  }

  getProjectsCreated() {
    this.bugService.getBugs().subscribe(b => {
      this.bugs = b
      this.dataSource = new MatTableDataSource(this.bugs);
      this.setPaginatorAndSort();

    });
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

  openForm() {
    const dialogRef = this.dialog.open(BugFormComponent, {
      width: '50%',
      data: ""
    });
    dialogRef.afterClosed().subscribe(result => {
    });
  }

  // delete(idProject: any) {
  //   if (confirm("Are you sure to delete?")) {
  //     this.projectService.deleteProject(idProject).subscribe(data => {
  //     });
  //     this.projectService.getProjects().subscribe((response) => {
  //       this.projects = response;
  //     })
  //   }
  // }

  // update(project: any){
  //   const dialogRef = this.dialog.open(ProjectFormComponent, {
  //     width: '50%',
  //     data: project
  //   });
  //   dialogRef.afterClosed().subscribe(result => {
  //   });
  // }

}
