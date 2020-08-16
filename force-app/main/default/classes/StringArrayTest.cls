public class StringArrayTest {
    public static String[] generateStringArray(Integer nstrings) {
        List<String> res = new List<String>();

        if (nstrings > 0) {
            for (Integer i = 0; i < nstrings; i++) {
                res.add('Test '+i);
            }
        }

        System.debug(res);
        return res;
    }
}
