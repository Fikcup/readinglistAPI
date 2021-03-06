const connection = require('../db/config/connection');

const adminController = {
    // Admin users can grant admin access
    updateAdminAccess(req, res) {
        connection.query(
            `UPDATE users 
            SET 
                admin = ${req.body.admin}
            WHERE 
                id = ${req.params.userId}`,
            (err, req) => {
                if (err) {
                    console.log(err);
                    res.status(500).json(err);
                    return;
                }

                res.json({ message: `User has been granted admin access!` });
            }
        );
    }
}

module.exports = adminController;