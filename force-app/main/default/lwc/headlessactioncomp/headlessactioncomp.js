import { LightningElement, api } from 'lwc';
export default class Headlessactioncomp extends LightningElement {

    @api recordId;

    @api invoke(){
        console.log('current page record id :' +  this.recordId);
    }

}