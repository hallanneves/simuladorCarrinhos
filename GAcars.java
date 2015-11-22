

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author François
 */
public class GAcars {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {

        //ControleGenetico cg = new ControleGenetico();
        //cg.setVisible(true);
        if (args.length>0){
            try {
                Populacao.primeiraPopulacao();
            } catch (IOException ex) {
                Logger.getLogger(ControleGenetico.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else{
            System.out.println("evoluiu");
            Populacao.evoluir(40);
        }

    }

}
