

import java.util.Random;

/**
 * @author François
 *
 * Vel;D0,D5;A0,A5;R0,R5
 *
 */
public class Individuo {

    private String gene;

    public Individuo() {
        Random r = new Random();
        gene = Integer.toString(r.nextInt(100))+";";

        for (int i = 0; i < 5; i++) {
            gene = gene + Integer.toString(r.nextInt(100)) + ",";
        }
        gene = gene + Integer.toString(r.nextInt(100)) + ";";
        for (int i = 0; i < 5; i++) {
            gene = gene + Integer.toString(r.nextInt(100)) + ",";
        }
        gene = gene + Integer.toString(r.nextInt(100)) + ";";
        for (int i = 0; i < 5; i++) {
            gene = gene + Integer.toString(r.nextInt(100)) + ",";
        }
        gene = gene + Integer.toString(r.nextInt(100)) + ";";
    }

    public Individuo(String gene) {
        this.gene = gene;
    }

    public String getGene() {
        return gene;
    }

}
