import { LightningElement, wire, track, api}  from 'lwc';
import getAccountsRecords from '@salesforce/apex/practiceclass.getAccountsRecords';
import refreshApex from '@salesforce/apex';

export default class AccountsDataTable extends LightningElement {

    @track AccountRecords = [];

    currentOffset = 0;

    @api recordId;
    @api objectApiName;
    @api userId;


    connectedCallback() {
        console.log('Current Record Id' +  this.recordId);
        console.log('Current Record Object Api Name' + this.objectApiName);
    }


    

   

    @wire(getAccountsRecords, {offsetVal : '$currentOffset'})
    accountsData({data, error}){
        try{

             if(data){

                console.log(JSON.stringify(data));

            this.AccountRecords = data;

            }else{

                console.error(error);

            }

        }catch(Exception){
            console.error(Exception);
        }
       

    }

    handleOffset(){

        this.currentOffset++;

        this.refs.mychild1.showmsgtouser('Hello from Parent !');

      

    }


    handlechildmsg(){

        
    }



}