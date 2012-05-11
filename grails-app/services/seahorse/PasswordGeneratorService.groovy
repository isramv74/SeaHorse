package seahorse

class PasswordGeneratorService {

    static transactional = true

    int DEFAULT_SIZE = 8

    Random rnd = new Random()
    String DATA =
        '234567892345678923456789'+
        'abcdefghijkmnpqrstuvwxyz'+
        'ABCDEFGHJKLMNPQRSTUVWXYZ'

    String generateNew() {
        return generateNew(DEFAULT_SIZE)
    }

    String generateNew(int size) {
        StringBuffer result = new StringBuffer()

        size.times {
            result << DATA[rnd.nextInt(DATA.length())]
        }

        return result.toString()
    }
}
