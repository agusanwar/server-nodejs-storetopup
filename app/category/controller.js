const Category = require("./model");

module.exports={
    index: async(req, res)=>{
        try {
          const category = await Category.find();
            res.render('admin/category/view_catgeory',{
              category,
            });
        } catch (err) {
            console.log(err)
        }
    },
    viewCreate: async (req, res) => {
        try {
          res.render("admin/category/create", {
            title: "Dashboard | Create Category",
          });
        } catch (err) {
        
          console.log(err);
        }
      },

      
  // model create
  actionCreate: async (req, res) => {
    try {
      const { name } = req.body;
      // save to mongoose
      let category = await Category({ name });
      await category.save();

      res.redirect("/category");
    } catch (err) {
  
      console.log(err);
    }
  },

}