using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Stats
{
    public interface IStatModifier
    {
        public IEnumerable<float> GetAdditiveModifier(Stats stat);
        public IEnumerable<float> GetPercentageModifier(Stats stat);
    }
}