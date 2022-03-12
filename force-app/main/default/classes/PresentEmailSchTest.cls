/**
 * Created by maxpr on 01.03.2022.
 */
@IsTest
private class PresentEmailSchTest {
    @IsTest
     static void presentEmailSchTest(){
        Test.startTest();
        System.schedule('PresentEmailSchedulable', '0 0 12 1 1 ? *',new PresentEmailSchedulable());
        Test.stopTest();
    }
}