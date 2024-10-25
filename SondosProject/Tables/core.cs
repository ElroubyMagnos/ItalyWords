using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SondosProject.Tables
{
    public class core : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder ob)
        {
            base.OnConfiguring(ob);

            ob.UseSqlite("Data Source=" + AppDomain.CurrentDomain.BaseDirectory + "\\sondos.db");
        }

        protected override void OnModelCreating(ModelBuilder mb)
        {
            base.OnModelCreating(mb);
        }

        public DbSet<OneWord> Words { get; set; }
    }
}
