/**
 * Created by maxpr on 22.02.2022.
 */

public class PresentEmailSchedulable implements Schedulable {
    public void execute(SchedulableContext sc) {
        Database.executeBatch(new PresentEmail());
    }
}