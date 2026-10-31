import { LightningElement, api } from 'lwc';
export default class MyChildCom extends LightningElement {

    displayValue = '';
    
    
    @api showmsgtouser(useInp){

        this.displayValue = useInp;
        

    }

}