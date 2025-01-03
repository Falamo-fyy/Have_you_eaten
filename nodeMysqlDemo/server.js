const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const mysql = require('mysql');
app.use(bodyParser.json());

// 处理POST请求
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
        return res.status(400).json({ error: '数据不完整' });
    }

    // 将数据插入数据库
    const insertQuery = 'INSERT INTO cart_data (cartTotal, cartItems) VALUES (?, ?)';
    db.query(insertQuery, [cartTotal, JSON.stringify(cartItems)], (err, result) => {
        if (err) {
            console.error('数据插入失败:', err.message);
            return res.status(500).json({ error: '数据存储失败', details: err.message });
        }
        res.status(200).json({ message: '数据上传成功', insertId: result.insertId });
    });
});

app.use(express.json());

// 登录接口
app.post('/login', (req, res) => {
    const { username, password } = req.body;
    const query = `SELECT username, password FROM employee WHERE username =? AND password =?`;
    db.query(query, [username, password], (err, results) => {
        if (err) {
            console.error('查询数据库出错: ', err);
            res.status(500).json({ message: '服务器内部错误' });
            return;
        }
        if (results.length > 0) {
            // 登录成功，返回成功信息等（这里可以根据实际需求返回更多用户相关数据）
            res.json({ message: '登录成功', success: true });
        } else {
            // 登录失败，用户名或密码错误
            res.json({ message: '用户名或密码错误', success: false });
        }
    });
});

// 注册接口
app.post('/register', (req, res) => {
    const { username, password } = req.body;
    // 先查询数据库看用户名是否已存在
    const checkQuery = `SELECT username FROM employee WHERE username =?`;
    db.query(checkQuery, [username], (checkErr, checkResults) => {
        if (checkErr) {
            console.error('检查用户名是否存在时出错: ', checkErr);
            res.status(500).json({ message: '服务器内部错误' });
            return;
        }
        if (checkResults.length > 0) {
            res.json({ message: '用户名已存在', success: false });
            return;
        }

        // 用户名不存在，执行插入新用户数据操作
        const insertQuery = `INSERT INTO employee (username, password) VALUES (?,?)`;
        db.query(insertQuery, [username, password], (insertErr, insertResults) => {
            if (insertErr) {
                console.error('插入用户数据出错: ', insertErr);
                res.status(500).json({ message: '服务器内部错误' });
                return;
            }
            res.json({ message: '注册成功', success: true });
        });
    });
});



// 处理一次性返回整个表中所有图片的请求
app.get('/get-images', (req, res) => {
    const { table, column } = req.query;  // 从查询参数获取表名和列名

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

    // 查询整个表中的所有图片数据
    const query = `SELECT id, ?? FROM ??`;
    connection.query(query, [column, table], function (error, results, fields) {
        if (error) {
            console.error(error);
            res.status(500).send('Internal Server Error');
            return;
        }

        // 如果有图片数据，返回所有的图片数据
        if (results.length > 0) {
            const images = results.map(row => ({
                id: row.id,
                image: row[column].toString('base64') // 将二进制数据转换为 Base64 格式
            }));

            res.json({ images }); // 返回所有图片的数据
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
    const shopId = req.query.shopId; // 获取前端传递的店铺ID参数
    if (!shopId) {
        return res.status(400).json({
            error: '缺少店铺ID参数',
            message: '请传递shopId参数来获取对应店铺商品数据'
        });
    }
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '123456',
        database: 'elm'
    });
    connection.connect();
    const query = `SELECT * FROM bwcj WHERE Foreign_key =?`; // 修改查询语句，添加筛选条件
    connection.query(query, [shopId], function (error, results, fields) {
        if (error) {
            res.status(500).json({
                error: '数据库查询失败',
                message: error.message
            });
            return;
        }
        res.json(results);
    });
    connection.end();
});

// 查询所有购物车数据接口
app.get('/api/getCartData', (req, res) => {
    const query = 'SELECT * FROM cart_data ORDER BY uploadTime DESC';

    db.query(query, (err, results) => {
        if (err) {
            console.error('查询数据失败:', err.message);
            return res.status(500).json({ error: '数据查询失败', details: err.message });
        }
        res.status(200).json({ cartData: results });
    });
});



app.listen(3000, () => {
    console.log('server running at http://127.0.0.1:3000');
});
