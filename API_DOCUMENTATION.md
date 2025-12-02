# Throw Delivery - API Documentation

> **Status**: This documentation outlines the required API endpoints for the Throw Delivery application. These APIs are not yet implemented but are necessary for full application functionality.

## Table of Contents

1. [Authentication APIs](#authentication-apis)
2. [User Profile APIs](#user-profile-apis)
3. [Delivery Request APIs](#delivery-request-apis)
4. [Bidding APIs](#bidding-apis)
5. [Order Management APIs](#order-management-apis)
6. [Document Management APIs](#document-management-apis)
7. [Feedback APIs](#feedback-apis)
8. [Common Response Formats](#common-response-formats)
9. [Error Handling](#error-handling)

---

## Authentication APIs

### 1. Login

**Endpoint**: `POST /api/v1/auth/login`

**Description**: Authenticate delivery driver and return access token.

**Request Body**:
```json
{
  "email": "driver@example.com",
  "password": "securePassword123"
}
```

**Success Response** (200 OK):
```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "user": {
      "id": "user_123",
      "name": "John Doe",
      "email": "driver@example.com",
      "phone": "+1234567890",
      "profileImage": "https://cdn.example.com/profiles/user_123.jpg",
      "vehicleType": "Motorcycle",
      "vehicleModel": "Honda CBR",
      "licensePlate": "ABC-1234",
      "status": "approved",
      "rating": 4.8,
      "totalDeliveries": 150
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refreshToken": "refresh_token_here",
    "expiresIn": 3600
  }
}
```

**Error Response** (401 Unauthorized):
```json
{
  "success": false,
  "message": "Invalid email or password",
  "error": {
    "code": "INVALID_CREDENTIALS",
    "details": null
  }
}
```

---

### 2. Register

**Endpoint**: `POST /api/v1/auth/register`

**Description**: Register a new delivery driver account.

**Request Body** (multipart/form-data):
```
name: "John Doe"
email: "driver@example.com"
phone: "+1234567890"
password: "securePassword123"
vehicleType: "Motorcycle"
vehicleModel: "Honda CBR"
licensePlate: "ABC-1234"
profileImage: [File]
```

**Success Response** (201 Created):
```json
{
  "success": true,
  "message": "Registration successful. Please upload your documents.",
  "data": {
    "userId": "user_123",
    "email": "driver@example.com",
    "status": "pending_documents"
  }
}
```

**Error Response** (400 Bad Request):
```json
{
  "success": false,
  "message": "Email already exists",
  "error": {
    "code": "EMAIL_EXISTS",
    "details": {
      "field": "email"
    }
  }
}
```

---

### 3. Logout

**Endpoint**: `POST /api/v1/auth/logout`

**Headers**: `Authorization: Bearer {token}`

**Success Response** (200 OK):
```json
{
  "success": true,
  "message": "Logged out successfully"
}
```

---

### 4. Refresh Token

**Endpoint**: `POST /api/v1/auth/refresh`

**Request Body**:
```json
{
  "refreshToken": "refresh_token_here"
}
```

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "token": "new_access_token",
    "refreshToken": "new_refresh_token",
    "expiresIn": 3600
  }
}
```

---

## User Profile APIs

### 5. Get Profile

**Endpoint**: `GET /api/v1/profile`

**Headers**: `Authorization: Bearer {token}`

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "id": "user_123",
    "name": "John Doe",
    "email": "driver@example.com",
    "phone": "+1234567890",
    "profileImage": "https://cdn.example.com/profiles/user_123.jpg",
    "vehicleType": "Motorcycle",
    "vehicleModel": "Honda CBR",
    "licensePlate": "ABC-1234",
    "documents": {
      "frontLicense": "https://cdn.example.com/docs/front_123.jpg",
      "backLicense": "https://cdn.example.com/docs/back_123.jpg",
      "verified": true
    },
    "status": "approved",
    "rating": 4.8,
    "totalDeliveries": 150,
    "totalEarnings": 15000.50,
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-12-01T15:20:00Z"
  }
}
```

---

### 6. Update Profile

**Endpoint**: `PUT /api/v1/profile`

**Headers**: `Authorization: Bearer {token}`

**Request Body** (multipart/form-data):
```
name: "John Doe Updated"
phone: "+1234567890"
vehicleType: "Car"
vehicleModel: "Toyota Camry"
licensePlate: "XYZ-5678"
profileImage: [File] (optional)
```

**Success Response** (200 OK):
```json
{
  "success": true,
  "message": "Profile updated successfully",
  "data": {
    "id": "user_123",
    "name": "John Doe Updated",
    "phone": "+1234567890",
    "vehicleType": "Car",
    "vehicleModel": "Toyota Camry",
    "licensePlate": "XYZ-5678",
    "updatedAt": "2024-12-02T10:15:00Z"
  }
}
```

---

### 7. Upload Documents

**Endpoint**: `POST /api/v1/profile/documents`

**Headers**: `Authorization: Bearer {token}`

**Request Body** (multipart/form-data):
```
frontLicense: [File]
backLicense: [File]
```

**Success Response** (200 OK):
```json
{
  "success": true,
  "message": "Documents uploaded successfully. Pending verification.",
  "data": {
    "frontLicense": "https://cdn.example.com/docs/front_123.jpg",
    "backLicense": "https://cdn.example.com/docs/back_123.jpg",
    "verified": false,
    "status": "pending_review"
  }
}
```

---

## Delivery Request APIs

### 8. Get Available Delivery Requests

**Endpoint**: `GET /api/v1/delivery-requests`

**Headers**: `Authorization: Bearer {token}`

**Query Parameters**:
- `status` (optional): `available`, `in_progress`, `completed`
- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 20)

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "requests": [
      {
        "id": "req_456",
        "customerId": "cust_789",
        "customerName": "Jane Smith",
        "pickupLocation": {
          "address": "123 Main St, City",
          "latitude": 40.7128,
          "longitude": -74.0060
        },
        "dropoffLocation": {
          "address": "456 Oak Ave, City",
          "latitude": 40.7580,
          "longitude": -73.9855
        },
        "distance": 5.2,
        "estimatedDuration": 25,
        "packageDetails": {
          "weight": "2kg",
          "dimensions": "30x20x15cm",
          "description": "Electronics"
        },
        "baseBidAmount": 150.00,
        "currentMinBid": 120.00,
        "biddingDeadline": "2024-12-02T16:00:00Z",
        "pickupTime": "2024-12-02T17:00:00Z",
        "status": "available",
        "totalBids": 5,
        "createdAt": "2024-12-02T14:30:00Z"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 5,
      "totalItems": 100,
      "itemsPerPage": 20
    }
  }
}
```

---

### 9. Get Delivery Request Details

**Endpoint**: `GET /api/v1/delivery-requests/{requestId}`

**Headers**: `Authorization: Bearer {token}`

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "id": "req_456",
    "customerId": "cust_789",
    "customerName": "Jane Smith",
    "customerPhone": "+1234567890",
    "customerImage": "https://cdn.example.com/customers/cust_789.jpg",
    "pickupLocation": {
      "address": "123 Main St, City",
      "latitude": 40.7128,
      "longitude": -74.0060,
      "instructions": "Ring doorbell twice"
    },
    "dropoffLocation": {
      "address": "456 Oak Ave, City",
      "latitude": 40.7580,
      "longitude": -73.9855,
      "instructions": "Leave at front desk"
    },
    "distance": 5.2,
    "estimatedDuration": 25,
    "packageDetails": {
      "weight": "2kg",
      "dimensions": "30x20x15cm",
      "description": "Electronics",
      "fragile": true
    },
    "baseBidAmount": 150.00,
    "currentMinBid": 120.00,
    "biddingDeadline": "2024-12-02T16:00:00Z",
    "pickupTime": "2024-12-02T17:00:00Z",
    "status": "available",
    "totalBids": 5,
    "myBid": null,
    "createdAt": "2024-12-02T14:30:00Z"
  }
}
```

---

## Bidding APIs

### 10. Place Bid

**Endpoint**: `POST /api/v1/bids`

**Headers**: `Authorization: Bearer {token}`

**Request Body**:
```json
{
  "deliveryRequestId": "req_456",
  "bidAmount": 115.00
}
```

**Success Response** (201 Created):
```json
{
  "success": true,
  "message": "Bid placed successfully",
  "data": {
    "bidId": "bid_789",
    "deliveryRequestId": "req_456",
    "driverId": "user_123",
    "bidAmount": 115.00,
    "status": "pending",
    "rank": 2,
    "createdAt": "2024-12-02T15:00:00Z"
  }
}
```

**Error Response** (400 Bad Request):
```json
{
  "success": false,
  "message": "Bidding deadline has passed",
  "error": {
    "code": "BIDDING_CLOSED",
    "details": {
      "deadline": "2024-12-02T16:00:00Z"
    }
  }
}
```

---

### 11. Get Bid Status

**Endpoint**: `GET /api/v1/bids/{bidId}`

**Headers**: `Authorization: Bearer {token}`

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "bidId": "bid_789",
    "deliveryRequestId": "req_456",
    "driverId": "user_123",
    "bidAmount": 115.00,
    "status": "accepted",
    "rank": 1,
    "totalBids": 8,
    "baseBidAmount": 150.00,
    "currentMinBid": 115.00,
    "acceptedAt": "2024-12-02T16:05:00Z",
    "createdAt": "2024-12-02T15:00:00Z"
  }
}
```

---

### 12. Get My Bids

**Endpoint**: `GET /api/v1/bids/my-bids`

**Headers**: `Authorization: Bearer {token}`

**Query Parameters**:
- `status` (optional): `pending`, `accepted`, `rejected`, `expired`
- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 20)

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "bids": [
      {
        "bidId": "bid_789",
        "deliveryRequestId": "req_456",
        "bidAmount": 115.00,
        "status": "accepted",
        "rank": 1,
        "deliveryRequest": {
          "pickupLocation": "123 Main St, City",
          "dropoffLocation": "456 Oak Ave, City",
          "distance": 5.2,
          "pickupTime": "2024-12-02T17:00:00Z"
        },
        "createdAt": "2024-12-02T15:00:00Z"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 3,
      "totalItems": 50,
      "itemsPerPage": 20
    }
  }
}
```

---

### 13. Cancel Bid

**Endpoint**: `DELETE /api/v1/bids/{bidId}`

**Headers**: `Authorization: Bearer {token}`

**Success Response** (200 OK):
```json
{
  "success": true,
  "message": "Bid cancelled successfully"
}
```

**Error Response** (400 Bad Request):
```json
{
  "success": false,
  "message": "Cannot cancel accepted bid",
  "error": {
    "code": "BID_ALREADY_ACCEPTED",
    "details": null
  }
}
```

---

## Order Management APIs

### 14. Get My Orders

**Endpoint**: `GET /api/v1/orders`

**Headers**: `Authorization: Bearer {token}`

**Query Parameters**:
- `status` (optional): `pending`, `in_progress`, `completed`, `cancelled`
- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 20)

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "orders": [
      {
        "orderId": "order_101",
        "deliveryRequestId": "req_456",
        "customerId": "cust_789",
        "customerName": "Jane Smith",
        "pickupLocation": {
          "address": "123 Main St, City",
          "latitude": 40.7128,
          "longitude": -74.0060
        },
        "dropoffLocation": {
          "address": "456 Oak Ave, City",
          "latitude": 40.7580,
          "longitude": -73.9855
        },
        "distance": 5.2,
        "deliveryAmount": 115.00,
        "status": "in_progress",
        "pickupTime": "2024-12-02T17:00:00Z",
        "estimatedDeliveryTime": "2024-12-02T17:30:00Z",
        "actualPickupTime": "2024-12-02T17:05:00Z",
        "actualDeliveryTime": null,
        "createdAt": "2024-12-02T16:05:00Z"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 10,
      "totalItems": 200,
      "itemsPerPage": 20
    }
  }
}
```

---

### 15. Get Order Details

**Endpoint**: `GET /api/v1/orders/{orderId}`

**Headers**: `Authorization: Bearer {token}`

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "orderId": "order_101",
    "deliveryRequestId": "req_456",
    "customerId": "cust_789",
    "customerName": "Jane Smith",
    "customerPhone": "+1234567890",
    "customerImage": "https://cdn.example.com/customers/cust_789.jpg",
    "pickupLocation": {
      "address": "123 Main St, City",
      "latitude": 40.7128,
      "longitude": -74.0060,
      "instructions": "Ring doorbell twice"
    },
    "dropoffLocation": {
      "address": "456 Oak Ave, City",
      "latitude": 40.7580,
      "longitude": -73.9855,
      "instructions": "Leave at front desk"
    },
    "distance": 5.2,
    "packageDetails": {
      "weight": "2kg",
      "dimensions": "30x20x15cm",
      "description": "Electronics",
      "fragile": true
    },
    "deliveryAmount": 115.00,
    "status": "in_progress",
    "pickupTime": "2024-12-02T17:00:00Z",
    "estimatedDeliveryTime": "2024-12-02T17:30:00Z",
    "actualPickupTime": "2024-12-02T17:05:00Z",
    "actualDeliveryTime": null,
    "otp": "1234",
    "timeline": [
      {
        "status": "accepted",
        "timestamp": "2024-12-02T16:05:00Z"
      },
      {
        "status": "picked_up",
        "timestamp": "2024-12-02T17:05:00Z"
      }
    ],
    "createdAt": "2024-12-02T16:05:00Z"
  }
}
```

---

### 16. Update Order Status

**Endpoint**: `PUT /api/v1/orders/{orderId}/status`

**Headers**: `Authorization: Bearer {token}`

**Request Body**:
```json
{
  "status": "picked_up",
  "latitude": 40.7128,
  "longitude": -74.0060,
  "timestamp": "2024-12-02T17:05:00Z"
}
```

**Possible Status Values**:
- `accepted` - Driver accepted the order
- `en_route_to_pickup` - Driver is heading to pickup location
- `arrived_at_pickup` - Driver arrived at pickup location
- `picked_up` - Package picked up
- `en_route_to_dropoff` - Driver is heading to dropoff location
- `arrived_at_dropoff` - Driver arrived at dropoff location
- `delivered` - Package delivered
- `cancelled` - Order cancelled

**Success Response** (200 OK):
```json
{
  "success": true,
  "message": "Order status updated successfully",
  "data": {
    "orderId": "order_101",
    "status": "picked_up",
    "updatedAt": "2024-12-02T17:05:00Z"
  }
}
```

---

### 17. Verify Delivery OTP

**Endpoint**: `POST /api/v1/orders/{orderId}/verify-otp`

**Headers**: `Authorization: Bearer {token}`

**Request Body**:
```json
{
  "otp": "1234"
}
```

**Success Response** (200 OK):
```json
{
  "success": true,
  "message": "OTP verified successfully. Order completed.",
  "data": {
    "orderId": "order_101",
    "status": "delivered",
    "deliveryAmount": 115.00,
    "completedAt": "2024-12-02T17:28:00Z"
  }
}
```

**Error Response** (400 Bad Request):
```json
{
  "success": false,
  "message": "Invalid OTP",
  "error": {
    "code": "INVALID_OTP",
    "details": {
      "attemptsRemaining": 2
    }
  }
}
```

---

### 18. Get Delivery History

**Endpoint**: `GET /api/v1/orders/history`

**Headers**: `Authorization: Bearer {token}`

**Query Parameters**:
- `startDate` (optional): Filter from date (ISO 8601)
- `endDate` (optional): Filter to date (ISO 8601)
- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 20)

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "orders": [
      {
        "orderId": "order_100",
        "customerName": "John Customer",
        "pickupLocation": "789 Pine St, City",
        "dropoffLocation": "321 Elm St, City",
        "distance": 3.5,
        "deliveryAmount": 95.00,
        "status": "delivered",
        "completedAt": "2024-12-01T18:45:00Z",
        "rating": 5,
        "feedback": "Great service!"
      }
    ],
    "summary": {
      "totalDeliveries": 150,
      "totalEarnings": 15000.50,
      "averageRating": 4.8
    },
    "pagination": {
      "currentPage": 1,
      "totalPages": 8,
      "totalItems": 150,
      "itemsPerPage": 20
    }
  }
}
```

---

## Document Management APIs

### 19. Get Document Status

**Endpoint**: `GET /api/v1/documents/status`

**Headers**: `Authorization: Bearer {token}`

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "frontLicense": {
      "url": "https://cdn.example.com/docs/front_123.jpg",
      "status": "verified",
      "uploadedAt": "2024-01-15T10:30:00Z",
      "verifiedAt": "2024-01-16T14:20:00Z"
    },
    "backLicense": {
      "url": "https://cdn.example.com/docs/back_123.jpg",
      "status": "verified",
      "uploadedAt": "2024-01-15T10:30:00Z",
      "verifiedAt": "2024-01-16T14:20:00Z"
    },
    "overallStatus": "verified"
  }
}
```

**Possible Status Values**:
- `pending_upload` - Document not uploaded yet
- `pending_review` - Document uploaded, awaiting verification
- `verified` - Document verified
- `rejected` - Document rejected (requires re-upload)

---

### 20. Update Documents

**Endpoint**: `PUT /api/v1/documents`

**Headers**: `Authorization: Bearer {token}`

**Request Body** (multipart/form-data):
```
frontLicense: [File] (optional)
backLicense: [File] (optional)
```

**Success Response** (200 OK):
```json
{
  "success": true,
  "message": "Documents updated successfully. Pending verification.",
  "data": {
    "frontLicense": {
      "url": "https://cdn.example.com/docs/front_123_new.jpg",
      "status": "pending_review"
    },
    "backLicense": {
      "url": "https://cdn.example.com/docs/back_123_new.jpg",
      "status": "pending_review"
    }
  }
}
```

---

## Feedback APIs

### 21. Submit Feedback

**Endpoint**: `POST /api/v1/feedback`

**Headers**: `Authorization: Bearer {token}`

**Request Body**:
```json
{
  "orderId": "order_100",
  "rating": 5,
  "comment": "Great experience! Fast delivery."
}
```

**Success Response** (201 Created):
```json
{
  "success": true,
  "message": "Feedback submitted successfully",
  "data": {
    "feedbackId": "feedback_202",
    "orderId": "order_100",
    "rating": 5,
    "comment": "Great experience! Fast delivery.",
    "createdAt": "2024-12-02T18:00:00Z"
  }
}
```

---

### 22. Get My Feedbacks

**Endpoint**: `GET /api/v1/feedback/my-feedbacks`

**Headers**: `Authorization: Bearer {token}`

**Query Parameters**:
- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 20)

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "feedbacks": [
      {
        "feedbackId": "feedback_202",
        "orderId": "order_100",
        "customerName": "John Customer",
        "rating": 5,
        "comment": "Great experience! Fast delivery.",
        "createdAt": "2024-12-02T18:00:00Z"
      }
    ],
    "summary": {
      "averageRating": 4.8,
      "totalFeedbacks": 120,
      "ratingDistribution": {
        "5": 80,
        "4": 30,
        "3": 8,
        "2": 2,
        "1": 0
      }
    },
    "pagination": {
      "currentPage": 1,
      "totalPages": 6,
      "totalItems": 120,
      "itemsPerPage": 20
    }
  }
}
```

---

## Common Response Formats

### Success Response Structure

```json
{
  "success": true,
  "message": "Operation successful",
  "data": {
    // Response data
  }
}
```

### Error Response Structure

```json
{
  "success": false,
  "message": "Human-readable error message",
  "error": {
    "code": "ERROR_CODE",
    "details": {
      // Additional error details
    }
  }
}
```

---

## Error Handling

### HTTP Status Codes

- **200 OK**: Request successful
- **201 Created**: Resource created successfully
- **400 Bad Request**: Invalid request parameters
- **401 Unauthorized**: Authentication required or failed
- **403 Forbidden**: Insufficient permissions
- **404 Not Found**: Resource not found
- **409 Conflict**: Resource conflict (e.g., duplicate entry)
- **422 Unprocessable Entity**: Validation errors
- **429 Too Many Requests**: Rate limit exceeded
- **500 Internal Server Error**: Server error
- **503 Service Unavailable**: Service temporarily unavailable

### Common Error Codes

| Error Code | Description |
|------------|-------------|
| `INVALID_CREDENTIALS` | Invalid email or password |
| `EMAIL_EXISTS` | Email already registered |
| `INVALID_TOKEN` | Invalid or expired token |
| `UNAUTHORIZED` | Unauthorized access |
| `RESOURCE_NOT_FOUND` | Requested resource not found |
| `BIDDING_CLOSED` | Bidding deadline has passed |
| `BID_ALREADY_ACCEPTED` | Bid already accepted |
| `INVALID_OTP` | Invalid OTP code |
| `OTP_EXPIRED` | OTP has expired |
| `INVALID_STATUS_TRANSITION` | Invalid order status transition |
| `DOCUMENT_NOT_VERIFIED` | Documents not verified |
| `VALIDATION_ERROR` | Request validation failed |
| `RATE_LIMIT_EXCEEDED` | Too many requests |
| `SERVER_ERROR` | Internal server error |

### Validation Error Response

```json
{
  "success": false,
  "message": "Validation failed",
  "error": {
    "code": "VALIDATION_ERROR",
    "details": {
      "fields": [
        {
          "field": "email",
          "message": "Invalid email format"
        },
        {
          "field": "password",
          "message": "Password must be at least 6 characters"
        }
      ]
    }
  }
}
```

---

## Authentication

All authenticated endpoints require a Bearer token in the Authorization header:

```
Authorization: Bearer {access_token}
```

Tokens expire after 1 hour. Use the refresh token endpoint to obtain a new access token.

---

## Rate Limiting

API requests are rate-limited to prevent abuse:

- **Authentication endpoints**: 5 requests per minute
- **General endpoints**: 100 requests per minute
- **Bid placement**: 10 requests per minute

Rate limit headers are included in responses:

```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1638360000
```

---

## Pagination

List endpoints support pagination with the following query parameters:

- `page`: Page number (default: 1)
- `limit`: Items per page (default: 20, max: 100)

Pagination information is included in the response:

```json
{
  "pagination": {
    "currentPage": 1,
    "totalPages": 10,
    "totalItems": 200,
    "itemsPerPage": 20,
    "hasNextPage": true,
    "hasPreviousPage": false
  }
}
```

---

## WebSocket Events (Real-time Updates)

### Connection

**Endpoint**: `wss://api.example.com/ws`

**Authentication**: Send token after connection:
```json
{
  "type": "auth",
  "token": "access_token_here"
}
```

### Events

#### 1. New Delivery Request Available

```json
{
  "type": "new_delivery_request",
  "data": {
    "requestId": "req_456",
    "pickupLocation": "123 Main St, City",
    "dropoffLocation": "456 Oak Ave, City",
    "baseBidAmount": 150.00,
    "biddingDeadline": "2024-12-02T16:00:00Z"
  }
}
```

#### 2. Bid Status Update

```json
{
  "type": "bid_status_update",
  "data": {
    "bidId": "bid_789",
    "status": "accepted",
    "orderId": "order_101"
  }
}
```

#### 3. Order Status Update

```json
{
  "type": "order_status_update",
  "data": {
    "orderId": "order_101",
    "status": "picked_up",
    "timestamp": "2024-12-02T17:05:00Z"
  }
}
```

#### 4. New Message from Customer

```json
{
  "type": "new_message",
  "data": {
    "orderId": "order_101",
    "message": "Please call when you arrive",
    "timestamp": "2024-12-02T17:10:00Z"
  }
}
```

---

## Notes

1. All timestamps are in ISO 8601 format (UTC)
2. All monetary values are in the base currency (e.g., USD, INR)
3. File uploads should be in JPEG, PNG, or PDF format with max size of 5MB
4. Distance is measured in kilometers
5. Duration is measured in minutes
6. Coordinates use decimal degrees format (latitude, longitude)

---

## API Versioning

The API uses URL versioning. The current version is `v1`. When breaking changes are introduced, a new version will be created (e.g., `v2`).

**Base URL**: `https://api.example.com/api/v1`

---

## Support

For API support and questions, contact:
- Email: api-support@throwdelivery.com
- Documentation: https://docs.throwdelivery.com
