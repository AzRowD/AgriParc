import { Component, OnInit } from '@angular/core';
import { MaterielService } from 'app/shared/services/materiel.service';
import { FormBuilder } from '@angular/forms';

declare interface TableData {
    headerRow: string[];
    dataRows: string[][];
}

@Component({
    selector: 'table-cmp',
    moduleId: module.id,
    templateUrl: 'table.component.html'
})

export class TableComponent implements OnInit {
    public tableData1: TableData;
    public tableData2: TableData;
    public listeMaterielc;
    public checkoutForm;

    
    constructor(private materielService: MaterielService, private formBuilder: FormBuilder) {
     
        this.checkoutForm = this.formBuilder.group({
            recherche: ''
        });
    }

    onSubmit() {
        this.materielService.getMaterielSearch()
            .then(
                (result) => {
                    if (null != result) {
                        this.listeMaterielc.push(result);
                    }
                });
        this.checkoutForm.reset();

    }
    ngOnInit() {


        this.materielService.getMateriel()
            .then((result) => {
                this.listeMaterielc = result;
                console.log(this.listeMaterielc);
            });

    }
}
