import { LightningElement, api } from 'lwc';
export default class MyChildCom extends LightningElement {

    displayValue = '';
    userName = '';
    
    
    @api showmsgtouser(useInp){

        this.displayValue = useInp;
        

    }

}