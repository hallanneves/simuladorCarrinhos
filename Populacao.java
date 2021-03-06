
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author François
 *
 * funções daqui: primeiraPopulacao, carregaPopulacao, selecionaCampeoes,
 * !escrevePopulacao, !procirar
 */
public class Populacao {

    public static ArrayList<Individuo> populacao = new ArrayList<>();

    public static void primeiraPopulacao() throws IOException {
        File arquivo = new File("populacao.txt"); //se já existir, será sobreescrito
        FileWriter fileWriter = new FileWriter(arquivo);
        try (BufferedWriter bufferedWriter = new BufferedWriter(fileWriter)) {
            for (int i = 0; i < 40; i++) {
                bufferedWriter.append(new Individuo().getGene());
                bufferedWriter.newLine();
                bufferedWriter.flush();
            }
            bufferedWriter.close();
        }
    }

    public static void carregaPopulacao() throws FileNotFoundException, IOException {

        FileInputStream stream = new FileInputStream("Populacao.txt");
        InputStreamReader reader = new InputStreamReader(stream);
        BufferedReader br = new BufferedReader(reader);
        String linha = br.readLine();
        populacao.clear();
        while (linha != null) {
            populacao.add(new Individuo(linha));
            linha = br.readLine();
        }
    }

    public static void selecionaCampeoes(int champs) {

        ArrayList<Individuo> selecionados = new ArrayList<>();

        for (int i = 0; i < champs; i++) {
            selecionados.add(populacao.get(i));
        }
        populacao.clear();
        populacao=selecionados;

    }

    public static void escrevePopulacao() throws IOException {
        File arquivo = new File("populacao.txt"); //se já existir, será sobreescrito
        FileWriter fileWriter = new FileWriter(arquivo);
        try (BufferedWriter bufferedWriter = new BufferedWriter(fileWriter)) {
            for (Individuo populacao1 : populacao) {
                bufferedWriter.append(populacao1.getGene());
                bufferedWriter.newLine();
                bufferedWriter.flush();
            }
            bufferedWriter.close();
        }
    }

    public static void procriar(int i1, int i2) {

        String pai1 = populacao.get(i1).getGene();
        String pai2 = populacao.get(i2).getGene();

        //vel
        int aux1, aux2;
        aux1=0;
        aux2=0;
        aux1 = pai1.indexOf(';') + 1;
        aux2 = pai2.indexOf(';') + 1;
        String filho1 = pai1.substring(0, aux1);
        String filho2 = pai2.substring(0, aux2);


        //d0
        filho1 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        filho2 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //d1
        filho1 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        filho2 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //d2
        filho1 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        filho2 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //d3
        filho1 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        filho2 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //d4
        filho1 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        filho2 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //d5
        filho1 += pai1.substring(aux1, pai1.indexOf(';', aux1) + 1);
        filho2 += pai2.substring(aux2, pai2.indexOf(';', aux2) + 1);
        aux1 = pai1.indexOf(';', aux1) + 1;
        aux2 = pai2.indexOf(';', aux2) + 1;
        //a0
        filho1 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        filho2 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //a1
        filho1 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        filho2 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //a2
        filho1 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        filho2 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //a3
        filho1 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        filho2 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //a4
        filho1 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        filho2 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //a5
        filho1 += pai1.substring(aux1, pai1.indexOf(';', aux1) + 1);
        filho2 += pai2.substring(aux2, pai2.indexOf(';', aux2) + 1);
        aux1 = pai1.indexOf(';', aux1) + 1;
        aux2 = pai2.indexOf(';', aux2) + 1;
        //r0
        filho1 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        filho2 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //r1
        filho1 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        filho2 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //r2
        filho1 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        filho2 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //r3
        filho1 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        filho2 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //r4
        filho1 += pai2.substring(aux2, pai2.indexOf(',', aux2) + 1);
        filho2 += pai1.substring(aux1, pai1.indexOf(',', aux1) + 1);
        aux1 = pai1.indexOf(',', aux1) + 1;
        aux2 = pai2.indexOf(',', aux2) + 1;
        //r5
        filho1 += pai1.substring(aux1, pai1.length());
        filho2 += pai2.substring(aux2, pai2.length());

        populacao.add(new Individuo(filho1));
        populacao.add(new Individuo(filho2));
    }

    public static void gerarMutante(int rate) {
        Random r = new Random();
        String eleito = populacao.get(r.nextInt(populacao.size())).getGene();
        String mutante = new String();
        int aux;
        aux=0;
        aux = eleito.indexOf(';') + 1;

        if (r.nextInt(100) > 35) {
            mutante = eleito.substring(0, aux);
        } else {
            mutante = Integer.toString(r.nextInt(100)) + ";";
        }

        for (int i = 0; i < 5; i++) { //d0-d4
            if (r.nextInt(100) > 35) {
                mutante += eleito.substring(aux, eleito.indexOf(',', aux) + 1);
            } else {
                mutante += Integer.toString(r.nextInt(100)) + ",";
            }
            aux = eleito.indexOf(',', aux) + 1;
        }

        //d5
        if (r.nextInt(100) > 35) {
            mutante += eleito.substring(aux, eleito.indexOf(';', aux) + 1);
        } else {
            mutante += Integer.toString(r.nextInt(100)) + ";";
        }
        aux = eleito.indexOf(';', aux) + 1;

        for (int i = 0; i < 5; i++) { //a0-a4
            if (r.nextInt(100) > 35) {
                mutante += eleito.substring(aux, eleito.indexOf(',', aux) + 1);
            } else {
                mutante += Integer.toString(r.nextInt(360)) + ",";
            }
            aux = eleito.indexOf(',', aux) + 1;
        }

        //a5
        if (r.nextInt(100) > 35) {
            mutante += eleito.substring(aux, eleito.indexOf(';', aux) + 1);
        } else {
            mutante += Integer.toString(r.nextInt(360)) + ";";
        }
        aux = eleito.indexOf(';', aux) + 1;

        for (int i = 0; i < 5; i++) { //r0-r4
            if (r.nextInt(100) > 35) {
                mutante += eleito.substring(aux, eleito.indexOf(',', aux) + 1);
            } else {
                mutante += Integer.toString(r.nextInt(100)) + ",";
            }
            aux = eleito.indexOf(',', aux) + 1;
        }
        //r5
        if (r.nextInt(100) > 35) {
            mutante += eleito.substring(aux, eleito.length());
        } else {
            mutante += Integer.toString(r.nextInt(100)) + ";";
        }
        populacao.add(new Individuo(mutante));
    }

    public static void procriarTodos() {
        int pais = populacao.size();
        for (int i = 0; i < pais; i++) {
            for (int j = i + 1; j < pais; j++) {
                procriar(i, j);
            }
        }
    }

    public static void genocidio() {
        populacao.clear();
    }

    public static void evoluir(int rate) throws IOException{
        genocidio();
        carregaPopulacao();
        selecionaCampeoes(4);
        procriarTodos();
        gerarMutante(rate);
        gerarMutante(rate);
        gerarMutante(rate);
        gerarMutante(rate);
        gerarMutante(rate);
        gerarMutante(rate);
        gerarMutante(rate);
        gerarMutante(rate);
        for (int i = 0; i < 16; i++) {
            populacao.add(new Individuo());
        }
        escrevePopulacao();
    }
}
