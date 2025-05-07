codeunit 50121 NewCustomerWS
{
    TableNo = Customer;

    trigger OnRun()
    begin

    end;

    [ServiceEnabled]
    procedure MyTestProcedure(): Text
    var
        myAnswer: Text[40];
    begin
        myAnswer := 'YES!';
        exit(myAnswer);
    end;


    procedure InsertCustomerWS(customerJson: Text): Boolean
    var
        JsonService: Codeunit JsonService;
        jsonObject: JsonObject;
        customerRec: Record Customer;
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NewCustomerNo: Code[20];

    begin
        jsonObject.ReadFrom(customerJson);

        SalesSetup.Get();
        NewCustomerNo := NoSeriesMgt.GetNextNo(SalesSetup."Customer Nos.", Today, true);

        customerRec.Init();
        customerRec."No." := NewCustomerNo; // Automatisk genereret
        //customerRec.Validate("No.", JsonService.GetFieldTextAsText(jsonObject, 'No'));
        customerRec.Validate("Name", JsonService.GetFieldTextAsText(jsonObject, 'Name'));
        customerRec.Validate("E-Mail", JsonService.GetFieldTextAsText(jsonObject, 'Email'));
        customerRec.Insert();

        exit(true);
    end;

}