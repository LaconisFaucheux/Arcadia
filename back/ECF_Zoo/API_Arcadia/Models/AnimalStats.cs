﻿using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace API_Arcadia.Models
{
    public class AnimalStats
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id { get; set; }
        public int AnimalId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string SpeciesName { get; set; } = string.Empty;
        public string MiniSlug { get; set; } = string.Empty;
        public uint NbClics { get; set; }
    }
}
