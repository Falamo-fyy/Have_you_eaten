const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const mysql = require('mysql');
app.use(bodyParser.json());

// ����POST����
app.post('/', (req, res) => {
    console.log(req.body);
    res.json(req.body);
});

app.post('/show', (req, res) => {
    console.log(req.body.name);
    const a = req.body.name;
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '123456',
        database: 'elm'
    });
    connection.connect();
    connection.query("select * from tb_tags where f_tagID='" + a + "'", function (error, results, fields) {
        if (error) throw console.error;
        res.json(results);
        console.log(results);
    });
    connection.end();
});
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'elm'
});
app.post('/api/uploadCart', (req, res) => {
    const { cartItems, cartTotal } = req.body;

    if (!cartItems || cartTotal === undefined) {
        return res.status(400).json({ error: '���ݲ�����' });
    }

    // �����ݲ������ݿ�
    const insertQuery = 'INSERT INTO cart_data (cartTotal, cartItems) VALUES (?, ?)';
    db.query(insertQuery, [cartTotal, JSON.stringify(cartItems)], (err, result) => {
        if (err) {
            console.error('���ݲ���ʧ��:', err.message);
            return res.status(500).json({ error: '���ݴ洢ʧ��', details: err.message });
        }
        res.status(200).json({ message: '�����ϴ��ɹ�', insertId: result.insertId });
    });
});

app.use(express.json());

// ��¼�ӿ�
app.post('/login', (req, res) => {
    const { username, password } = req.body;
    const query = `SELECT username, password FROM employee WHERE username =? AND password =?`;
    db.query(query, [username, password], (err, results) => {
        if (err) {
            console.error('��ѯ���ݿ����: ', err);
            res.status(500).json({ message: '�������ڲ�����' });
            return;
        }
        if (results.length > 0) {
            // ��¼�ɹ������سɹ���Ϣ�ȣ�������Ը���ʵ�����󷵻ظ����û�������ݣ�
            res.json({ message: '��¼�ɹ�', success: true });
        } else {
            // ��¼ʧ�ܣ��û������������
            res.json({ message: '�û������������', success: false });
        }
    });
});

// ע��ӿ�
app.post('/register', (req, res) => {
    const { username, password } = req.body;
    // �Ȳ�ѯ���ݿ⿴�û����Ƿ��Ѵ���
    const checkQuery = `SELECT username FROM employee WHERE username =?`;
    db.query(checkQuery, [username], (checkErr, checkResults) => {
        if (checkErr) {
            console.error('����û����Ƿ����ʱ����: ', checkErr);
            res.status(500).json({ message: '�������ڲ�����' });
            return;
        }
        if (checkResults.length > 0) {
            res.json({ message: '�û����Ѵ���', success: false });
            return;
        }

        // �û��������ڣ�ִ�в������û����ݲ���
        const insertQuery = `INSERT INTO employee (username, password) VALUES (?,?)`;
        db.query(insertQuery, [username, password], (insertErr, insertResults) => {
            if (insertErr) {
                console.error('�����û����ݳ���: ', insertErr);
                res.status(500).json({ message: '�������ڲ�����' });
                return;
            }
            res.json({ message: 'ע��ɹ�', success: true });
        });
    });
});



// ����һ���Է���������������ͼƬ������
app.get('/get-images', (req, res) => {
    const { table, column } = req.query;  // �Ӳ�ѯ������ȡ����������

    if (!table || !column) {
        return res.status(400).send('Missing required parameters');
    }

    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '123456',
        database: 'elm'
    });

    connection.connect();

    // ��ѯ�������е�����ͼƬ����
    const query = `SELECT id, ?? FROM ??`;
    connection.query(query, [column, table], function (error, results, fields) {
        if (error) {
            console.error(error);
            res.status(500).send('Internal Server Error');
            return;
        }

        // �����ͼƬ���ݣ��������е�ͼƬ����
        if (results.length > 0) {
            const images = results.map(row => ({
                id: row.id,
                image: row[column].toString('base64') // ������������ת��Ϊ Base64 ��ʽ
            }));

            res.json({ images }); // ��������ͼƬ������
        } else {
            res.status(404).send('No images found');
        }
    });

    connection.end();
});


app.get('/', (req, res) => {
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '123456',
        database: 'elm'
    });
    connection.connect();

    connection.query('select * from card', function (error, results, fields) {
        if (error) throw error;
        res.json(results);
    });
    connection.end();
});

app.get('/FenLei', (req, res) => {
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '123456',
        database: 'elm'
    });
    connection.connect();

    connection.query('select * from fenlei ', function (error, results, fields) {
        if (error) throw error;
        res.json(results);
    });
    connection.end();
});

app.get('/ShopList', (req, res) => {
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '123456',
        database: 'elm'
    });
    connection.connect();

    connection.query('select * from shoplist ', function (error, results, fields) {
        if (error) throw error;
        res.json(results);
    });
    connection.end();
});

app.get('/ShopListgoods', (req, res) => {
    const shopId = req.query.shopId; // ��ȡǰ�˴��ݵĵ���ID����
    if (!shopId) {
        return res.status(400).json({
            error: 'ȱ�ٵ���ID����',
            message: '�봫��shopId��������ȡ��Ӧ������Ʒ����'
        });
    }
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '123456',
        database: 'elm'
    });
    connection.connect();
    const query = `SELECT * FROM bwcj WHERE Foreign_key =?`; // �޸Ĳ�ѯ��䣬���ɸѡ����
    connection.query(query, [shopId], function (error, results, fields) {
        if (error) {
            res.status(500).json({
                error: '���ݿ��ѯʧ��',
                message: error.message
            });
            return;
        }
        res.json(results);
    });
    connection.end();
});

// ��ѯ���й��ﳵ���ݽӿ�
app.get('/api/getCartData', (req, res) => {
    const query = 'SELECT * FROM cart_data ORDER BY uploadTime DESC';

    db.query(query, (err, results) => {
        if (err) {
            console.error('��ѯ����ʧ��:', err.message);
            return res.status(500).json({ error: '���ݲ�ѯʧ��', details: err.message });
        }
        res.status(200).json({ cartData: results });
    });
});



app.listen(3000, () => {
    console.log('server running at http://127.0.0.1:3000');
});
