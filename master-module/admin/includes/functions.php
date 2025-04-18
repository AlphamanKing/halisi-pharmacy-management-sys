<?php
$connection = mysqli_connect("localhost", "root", "", "PharmEasy");
// $connection = mysqli_connect("localhost", "id18666014_md_taha_ahmed", "bGCL0+&4qT64IM_{", "id18666014_pharmeasy");
// query functions (start)
function query($query)
{
    global $connection;
    $run = mysqli_query($connection, $query);
    if ($run) {
        while ($row = $run->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    } else {
        return 0;
    }
}
function single_query($query)
{
    global $connection;
    $run = mysqli_query($connection, $query);
    if ($run) {
        return 1;
    } else {
        return 0;
    }
}
// query functions (end)
// redirect functions (start)
function post_redirect($url)
{
    ob_start();
    header('Location: ' . $url);
    // header('Location: https://md-taha-ahmed.000webhostapp.com/pharmeasy/admin/' . $url);
    ob_end_flush();
    die();
}
function get_redirect($url)
{
    echo " <script> 
    window.location.href = '$url'; 
    </script>";
    // echo "<script>
    // window.location.href = 'https://md-taha-ahmed.000webhostapp.com/pharmeasy/admin/" . $url . "';
    // </script>";
}
// redirect functions (end)
// messages function (start)
function message()
{
    if(isset($_SESSION['message'])) {
        $messages = [
            'loginErr' => 'There is no account with this email!',
            'emailErr' => 'The email address is already taken. Please choose another',
            'loginErr1' => 'The email or password is wrong!',
            'noResult' => 'There is no user with this email address.',
            'itemErr' => 'There is a product with the same name.',
            'noResultOrder' => 'There is no order with this ID!',
            'noResultItem' => 'There is no product with this name!',
            'noResultAdmin' => 'There is no admin with this email!',
            'empty_err' => 'Please don\'t leave anything empty!'
        ];

        if(isset($messages[$_SESSION['message']])) {
            $output = "<div class='alert alert-danger' role='alert'>";
            $output .= htmlentities($messages[$_SESSION['message']]);
            $output .= "</div>";
            unset($_SESSION['message']);
            return $output;
        }
    }
    return '';
}
// messages function (end)
// login function (start)
function login() {
    if(isset($_POST['login'])) {
        global $connection;
        
        $adminEmail = mysqli_real_escape_string($connection, $_POST['adminEmail']);
        $adminPassword = mysqli_real_escape_string($connection, $_POST['adminPassword']);
        
        // Fix: Use correct column name admin_email instead of email
        $query = "SELECT * FROM admin WHERE admin_email = ?";
        
        if($stmt = mysqli_prepare($connection, $query)) {
            mysqli_stmt_bind_param($stmt, "s", $adminEmail);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            
            if(mysqli_num_rows($result) == 0) {
                $_SESSION['message'] = "loginErr";
                return false;
            }
            
            $row = mysqli_fetch_array($result);
            if(password_verify($adminPassword, $row['admin_password'])) {
                $_SESSION['admin_id'] = $row['admin_id'];
                $_SESSION['admin_email'] = $row['admin_email'];
                header("Location: index.php");
                exit();
            } else {
                $_SESSION['message'] = "loginErr1";
                return false;
            }
            mysqli_stmt_close($stmt);
        } else {
            $_SESSION['message'] = "Error: Database query failed";
            return false;
        }
    }
}
// login function (end)
// user functions (start)
function all_users()
{
    $query = "SELECT user_id ,user_fname ,user_lname ,email ,user_address FROM user";
    $data = query($query);
    return $data;
}
function delete_user()
{
    if (isset($_GET['delete'])) {
        $userId = $_GET['delete'];
        $query = "DELETE FROM user WHERE user_id ='$userId'";
        $run = single_query($query);
        get_redirect("customers.php");
    }
}
function edit_user($id)
{
    if (isset($_POST['update'])) {
        $fname = trim($_POST['fname']);
        $lname = trim($_POST['lname']);
        $email = trim(strtolower($_POST['email']));
        $address = trim($_POST['address']);
        if (empty($email) or empty($address) or empty($fname) or empty($lname)) {
            $_SESSION['message'] = "empty_err";
            get_redirect("customers.php");
            return;
        }
        $check = check_email_user($email);
        if ($check == 0) {
            $query = "UPDATE user SET email='$email' ,user_fname='$fname' ,user_lname='$lname' ,user_address='$address' WHERE user_id= '$id'";
            single_query($query);
            get_redirect("customers.php");
        } else {
            $_SESSION['message'] = "emailErr";
            get_redirect("customers.php");
        }
    } elseif (isset($_POST['cancel'])) {
        get_redirect("customers.php");
    }
}
function get_user($id)
{
    $query = "SELECT user_id ,user_fname ,user_lname ,email ,user_address FROM user WHERE user_id=$id";
    $data = query($query);
    return $data;
}
function check_email_user($email)
{
    $query = "SELECT email FROM user WHERE email='$email'";
    $data = query($query);
    if ($data) {
        return 1;
    } else {
        return 0;
    }
}
function search_user()
{
    if (isset($_GET['search_user'])) {
        $email = trim(strtolower($_GET['search_user_email']));
        if (empty($email)) {
            return;
        }
        $query = "SELECT user_id ,user_fname ,user_lname ,email ,user_address FROM user WHERE email='$email'";
        $data = query($query);
        if ($data) {
            return $data;
        } else {
            $_SESSION['message'] = "noResult";
            return;
        }
    }
}
function get_user_details()
{
    if ($_GET['id']) {
        $id = $_GET['id'];
        $query = "SELECT * FROM user WHERE user_id=$id";
        $data = query($query);
        return $data;
    }
}
// user functions (end)
// item functions (start)
function all_items()
{
    $query = "SELECT * FROM item";
    $data = query($query);
    return $data;
}
function delete_item()
{
    if (isset($_GET['delete'])) {
        $itemID = $_GET['delete'];
        $query = "DELETE FROM item WHERE item_id ='$itemID'";
        $run = single_query($query);
        get_redirect("products.php");
    }
}
function edit_item($id)
{
    if (isset($_POST['update'])) {
        $name = trim($_POST['name']);
        $brand = trim($_POST['brand']);
        $cat = trim($_POST['cat']);
        $tags = trim($_POST['tags']);
        $image = trim($_POST['image']);
        $quantity = trim($_POST['quantity']);
        $price = trim($_POST['price']);
        $details = trim($_POST['details']);
        $check = check_name($name);
        if ($check == 0) {
            $query = "UPDATE item SET item_title='$name' ,item_brand='$brand' ,item_cat='$cat' ,
            item_details='$details',item_tags='$tags' 
            ,item_image='$image' ,item_quantity='$quantity' ,item_price='$price'  WHERE item_id= '$id'";
            $run = single_query($query);
            get_redirect("products.php");
        } else {
            $_SESSION['message'] = "itemErr";
            get_redirect("products.php");
        }
    } elseif (isset($_POST['cancel'])) {
        get_redirect("products.php");
    }
}
function get_item($id)
{
    $query = "SELECT * FROM item WHERE item_id=$id";
    $data = query($query);
    return $data;
}
function check_name($name)
{
    $query = "SELECT item_title FROM item WHERE item_title='$name'";
    $data = query($query);
    if ($data) {
        return 1;
    } else {
        return 0;
    }
}
function search_item()
{
    if (isset($_GET['search_item'])) {
        $name = trim($_GET['search_item_name']);
        $query = "SELECT * FROM item WHERE item_title LIKE '%$name%'";
        $data = query($query);
        if ($data) {
            return $data;
        } else {
            $_SESSION['message'] = "noResultItem";
            return;
        }
    }
}
function add_item()
{
    if (isset($_POST['add_item'])) {
        $name = trim($_POST['name']);
        $brand = trim($_POST['brand']);
        $cat = trim($_POST['cat']);
        $tags = trim($_POST['tags']);
        $image = trim($_POST['image']);
        $quantity = trim($_POST['quantity']);
        $price = trim($_POST['price']);
        $details = trim($_POST['details']);
        $check = check_name($name);
        if (
            empty($name) or empty($brand) or empty($cat)  or
            empty($tags) or empty($image) or empty($quantity) or empty($price) or empty($details)
        ) {
            $_SESSION['message'] = "empty_err";
            get_redirect("products.php");
            return;
        }
        if ($check == 0) {
            $query = "INSERT INTO item (item_title, item_brand, item_cat, item_details  ,
            item_tags ,item_image ,item_quantity ,item_price) VALUES
            ('$name' ,'$brand' ,'$cat' ,'$details' ,'$tags' ,'$image' ,'$quantity' ,'$price')";
            $run = single_query($query);
            get_redirect("products.php");
        } else {
            $_SESSION['message'] = "itemErr";
            get_redirect("products.php");
        }
    } elseif (isset($_POST['cancel'])) {
        get_redirect("products.php");
    }
}
function get_item_details()
{
    if ($_GET['id']) {
        $id = $_GET['id'];
        $query = "SELECT * FROM item WHERE item_id=$id";
        $data = query($query);
        return $data;
    }
}
// item functions (end)
// admin functions (start)
function all_admins()
{
    $query = "SELECT admin_id ,admin_fname ,admin_lname ,admin_email  FROM admin";
    $data = query($query);
    return $data;
}
function get_admin($id)
{
    $query = "SELECT admin_id ,admin_fname ,admin_lname ,admin_email  FROM admin WHERE admin_id=$id";
    $data = query($query);
    return $data;
}

function edit_admin($id)
{
    if (isset($_POST['admin_update'])) {
        $fname = trim($_POST['admin_fname']);
        $lname = trim($_POST['admin_lname']);
        $email = trim(strtolower($_POST['admin_email']));
        $password = trim($_POST['admin_password']);
        
        // Add input validation
        if (empty($fname) || empty($lname) || empty($email)) {
            $_SESSION['message'] = "empty_err";
            get_redirect("admin.php");
            return;
        }

        // First check if this email exists for another admin
        $query = "SELECT admin_email FROM admin WHERE admin_email='$email' AND admin_id != '$id'";
        $check = query($query);

        if (!$check) {
            if (!empty($password)) {
                // Hash the new password if provided
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);
                $query = "UPDATE admin SET 
                         admin_email = '$email',
                         admin_fname = '$fname',
                         admin_lname = '$lname',
                         admin_password = '$hashed_password'
                         WHERE admin_id = '$id'";
            } else {
                // Don't update password if none provided
                $query = "UPDATE admin SET 
                         admin_email = '$email',
                         admin_fname = '$fname',
                         admin_lname = '$lname'
                         WHERE admin_id = '$id'";
            }
            
            if(single_query($query)) {
                get_redirect("admin.php");
            } else {
                $_SESSION['message'] = "updateError";
                get_redirect("admin.php");
            }
        } else {
            $_SESSION['message'] = "emailErr";
            get_redirect("admin.php");
        }
    } elseif (isset($_POST['admin_cancel'])) {
        get_redirect("admin.php");
    }
}
function check_email_admin($email)
{
    $query = "SELECT admin_email FROM admin WHERE admin_email='$email'";
    $data = query($query);
    if ($data) {
        return $data;
    } else {
        return 0;
    }
}

function add_admin()
{
    if (isset($_POST['add_admin'])) {
        $fname = trim($_POST['admin_fname']);
        $lname = trim($_POST['admin_lname']);
        $email = trim(strtolower($_POST['admin_email']));
        $password = trim($_POST['admin_password']);
        
        // Add input validation
        if (empty($fname) || empty($lname) || empty($email) || empty($password)) {
            $_SESSION['message'] = "empty_err";
            get_redirect("admin.php");
            return;
        }

        $check = check_email_admin($email);
        if ($check == 0) {
            // Hash the password before storing
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            
            $query = "INSERT INTO admin (admin_fname, admin_lname, admin_email, admin_password) 
            VALUES ('$fname','$lname','$email','$hashed_password')";
            single_query($query);
            get_redirect("admin.php");
        } else {
            $_SESSION['message'] = "emailErr";
            get_redirect("admin.php");
        }
    } elseif (isset($_POST['admin_cancel'])) {
        get_redirect("admin.php");
    }
}
function delete_admin()
{
    if (isset($_GET['delete'])) {
        $adminId = $_GET['delete'];
        $query = "DELETE FROM admin WHERE admin_id ='$adminId'";
        $run = single_query($query);
        get_redirect("admin.php");
    }
}
function search_admin()
{
    if (isset($_GET['search_admin'])) {
        $email = trim(strtolower($_GET['search_admin_email']));
        if (empty($email)) {
            return;
        }
        $query = "SELECT admin_id ,admin_fname ,admin_lname ,admin_email FROM admin WHERE admin_email='$email'";
        $data = query($query);
        if ($data) {
            return $data;
        } else {
            $_SESSION['message'] = "noResultAdmin";
            return;
        }
    }
}
function check_admin($id)
{
    $query = "SELECT admin_id FROM admin where admin_id='$id'";
    $row = query($query);
    if (empty($row)) {
        return 0;
    } else {
        return 1;
    }
}
// admin functions (end)
// order functions (start)
function all_orders()
{
    $query = "SELECT * FROM orders";
    $data = query($query);
    return $data;
}
function search_order()
{
    if (isset($_GET['search_order'])) {
        $id = trim($_GET['search_order_id']);
        if (empty($id)) {
            return;
        }
        $query = "SELECT * FROM orders WHERE order_id='$id'";
        $data = query($query);
        if ($data) {
            return $data;
        } else {
            $_SESSION['message'] = "noResultOrder";
            return;
        }
    }
}
function delete_order()
{
    if (isset($_GET['delete'])) {
        $order_id = $_GET['delete'];
        $query = "DELETE FROM orders WHERE order_id ='$order_id'";
        $run = single_query($query);
        get_redirect("orders.php");
    } elseif (isset($_GET['done'])) {
        $order_id = $_GET['done'];
        $query = "UPDATE orders SET order_status = 1 WHERE order_id='$order_id'";
        single_query($query);
        get_redirect("orders.php");
    } elseif (isset($_GET['undo'])) {
        $order_id = $_GET['undo'];
        $query = "UPDATE orders SET order_status = 0 WHERE order_id='$order_id'";
        single_query($query);
        get_redirect("orders.php");
    }
}
// order functions (end)
