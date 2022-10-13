public class LeadViewAndExportCondition implements TxnSecurity.EventCondition {
    public boolean evaluate(SObject event) {
        switch on event{
            when ApiEvent apiEvent {
                return evaluate(apiEvent.QueriedEntities, apiEvent.RowsProcessed);
            }
            when ReportEvent reportEvent {
                return evaluate(reportEvent.QueriedEntities, reportEvent.RowsProcessed);
            }
            when ListViewEvent listViewEvent {
                return evaluate(listViewEvent.QueriedEntities, listViewEvent.RowsProcessed);
            }
            when null {
                 return false;
            }
            when else{
                return false;
            }
        }
    }
    private boolean evaluate(String queriedEntities, Decimal rowsProcessed){
        if(queriedEntities.contains('Lead') && rowsProcessed > 10){
            return true;
        }
        return false;
    }
}