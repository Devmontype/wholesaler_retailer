function errorResponse(res, message, statusCode = 500, error = {}) {
    return res.status(statusCode).json({
        success: false,
        message,
        error: {
            statusCode,
            message,
            error,
        },
    });
};
//errorResponse(res, 'Not found', 404, false);
module.exports={errorResponse}