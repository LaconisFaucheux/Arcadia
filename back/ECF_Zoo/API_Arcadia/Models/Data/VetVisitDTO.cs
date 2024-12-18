﻿namespace API_Arcadia.Models.Data
{
    public class VetVisitDTO
    {
        public int? Id { get; set; }
        public string Food { get; set; } = string.Empty;
        public float FoodWeight { get; set; }
        public int IdWeightUnit { get; set; }
        //public DateTime VisitDate { get; set; }
        public string Observations { get; set; } = string.Empty;
        public int IdAnimal { get; set; }
        public string IdVet { get; set; } = string.Empty;

        //DTO specific prop
        public int healthId { get; set; }
    }
}
